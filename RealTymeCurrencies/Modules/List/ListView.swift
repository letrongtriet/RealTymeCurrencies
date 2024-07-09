//
//  ListView.swift
//  RealTymeCurrencies
//
//  Created by Triet Le on 8.7.2024.
//

import SwiftUI

struct ListView: View {
    @StateObject private var viewModel = ListViewModel()

    var body: some View {
        NavigationStack {
            ZStack(alignment: .center) {
                switch viewModel.state {
                case .loading:
                    ProgressView()

                case .data(let cryptoCurrencies):
                    List {
                        ForEach(cryptoCurrencies, id: \.id) {
                            cryptoCell($0)
                        }
                    }

                case .error(let errorMessage):
                    Text(errorMessage)
                }
            }
            .navigationTitle("CryptoCurrencies")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                fiatCurrenciesMenuButton()
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
    }

    @ViewBuilder
    private func cryptoCell(_ crypto: CryptoCurrency) -> some View {
        NavigationLink {
            DetailsView(
                currency: crypto,
                fiatCurrency: viewModel.currentFiatCurrency
            )
            .toolbarRole(.editor)
        } label: {
            HStack(spacing: 8) {
                AsyncCachedImage(url: crypto.image) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 24, height: 24)
                } placeholder: {
                    ProgressView()
                }

                Text(crypto.symbol.uppercased())

                Spacer()

                Text("\(crypto.currentPrice, specifier: "%.2f") \(viewModel.currentFiatCurrency.uppercased())")
            }
        }
    }

    @ViewBuilder
    private func fiatCurrenciesMenuButton() -> some View {
        Menu(viewModel.currentFiatCurrency.uppercased()) {
            Section("Fiat currencies") {
                ForEach(viewModel.fiatCurrencies, id: \.self) { fiat in
                    Button {
                        viewModel.userDidSelectFiatCurrency(fiat)
                    } label: {
                        Text(fiat.uppercased())
                    }
                }
            }
        }
    }
}

#Preview {
    ListView()
}
