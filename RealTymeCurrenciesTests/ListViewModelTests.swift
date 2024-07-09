//
//  ListViewModelTests.swift
//  RealTymeCurrenciesTests
//
//  Created by Triet Le on 9.7.2024.
//

import Foundation

import XCTest
@testable import RealTymeCurrencies

final class ListViewModelTests: XCTestCase {
    @MainActor
    func testViewModelHasError() async {
        let viewModel = ListViewModel(
            fiatCurrenciesService: FiatCurrenciesServiceFail(),
            cryptoCurrenciesService: CryptoCurrenciesServiceFail()
        )

        XCTAssert(viewModel.state == .loading)

        viewModel.onAppear()
        try? await Task.sleep(nanoseconds: UInt64(1 * 1_000_000_000))

        XCTAssert(viewModel.state == .error("The operation couldn’t be completed. (RealTymeCurrencies.APIError error 1.)"))

        // In case of failed, we still get the default list
        XCTAssert(viewModel.fiatCurrencies ==  ["usd"])
    }

    @MainActor
    func testViewModelHasValidCryptoCurrencies() async {
        let viewModel = ListViewModel(
            fiatCurrenciesService: FiatCurrenciesServiceSuccess(),
            cryptoCurrenciesService: CryptoCurrenciesServiceSuccess()
        )

        XCTAssert(viewModel.state == .loading)

        viewModel.onAppear()
        try? await Task.sleep(nanoseconds: UInt64(1 * 1_000_000_000))

        XCTAssert(viewModel.state == .data(CryptoCurrenciesServiceSuccess.mockCryptoCurrencies))
        XCTAssert(viewModel.fiatCurrencies == FiatCurrenciesServiceSuccess.mockFiatCurrencies.map(\.symbol))
    }

    @MainActor
    func testViewModelChangeFiatCurrency() async {
        let viewModel = ListViewModel(
            fiatCurrenciesService: FiatCurrenciesServiceSuccess(),
            cryptoCurrenciesService: CryptoCurrenciesServiceSuccess()
        )

        XCTAssert(viewModel.currentFiatCurrency == "usd")

        viewModel.onAppear()
        try? await Task.sleep(nanoseconds: UInt64(1 * 1_000_000_000))

        XCTAssert(viewModel.fiatCurrencies == FiatCurrenciesServiceSuccess.mockFiatCurrencies.map(\.symbol))

        viewModel.userDidSelectFiatCurrency(viewModel.fiatCurrencies[2])

        XCTAssert(viewModel.currentFiatCurrency == viewModel.fiatCurrencies[2])
    }
}
