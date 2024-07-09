//
//  ListViewModel.swift
//  RealTymeCurrencies
//
//  Created by Triet Le on 8.7.2024.
//

import Combine
import Foundation

enum ListViewModelState: Equatable {
    case loading
    case data(CryptoCurrencies)
    case error(String)
}

@MainActor
final class ListViewModel: ObservableObject {
    // MARK: - Observables
    @Published var state: ListViewModelState = .loading
    @Published var fiatCurrencies: [String] = ["usd"]
    
    // Default this to USD
    // However, we can extend the init to inject fiat at run time
    @Published var currentFiatCurrency = "usd"

    // MARK: - Private properties
    private let fiatCurrenciesService: FiatCurrenciesServiceProtocol
    private let cryptoCurrenciesService: CryptoCurrenciesServiceProtocol
    private var cancellables: Set<AnyCancellable> = []

    init(
        fiatCurrenciesService: FiatCurrenciesServiceProtocol = FiatCurrenciesService(),
        cryptoCurrenciesService: CryptoCurrenciesServiceProtocol = CryptoCurrenciesService()
    ) {
        self.fiatCurrenciesService = fiatCurrenciesService
        self.cryptoCurrenciesService = cryptoCurrenciesService
    }

    // MARK: - Public methods
    func onAppear() {
        Task {
            await fetchCryptoCurrencies()
            await fetchFiatCurrencies()
        }
        startTimer()
    }

    func userDidSelectFiatCurrency(_ fiatCurrency: String) {
        currentFiatCurrency = fiatCurrency
        Task {
            await fetchCryptoCurrencies()
        }
    }

    // MARK: - Private methods
    private func startTimer() {
        Timer.publish(
            every: 10,
            on: .main,
            in: .common
        )
        .autoconnect()
        .sink { [weak self] _ in
            self?.refreshData()
        }
        .store(in: &cancellables)
    }

    private func refreshData() {
        Task {
            await fetchCryptoCurrencies()
        }
    }

    private func fetchFiatCurrencies() async {
        do {
            let fiats = try await fiatCurrenciesService.fetchAllFiatCurrencies()
            fiatCurrencies = fiats.map(\.symbol)
        } catch {
            // Fall through fiat fetching because we have 1 default USD which is universal currency
            print(error.localizedDescription)
        }
    }

    private func fetchCryptoCurrencies() async {
        do {
            let cryptoCurrencies = try await cryptoCurrenciesService.fetchCryptoCurrencies(
                fiatCurrency: currentFiatCurrency,
                sorting: .descending,
                limit: 10
            )
            state = .data(cryptoCurrencies)
        } catch {
            state = .error(error.localizedDescription)
        }
    }
}
