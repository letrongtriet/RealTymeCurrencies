//
//  FiatCurrenciesServiceSuccess.swift
//  RealTymeCurrenciesTests
//
//  Created by Triet Le on 9.7.2024.
//

import XCTest
@testable import RealTymeCurrencies

struct FiatCurrenciesServiceSuccess: FiatCurrenciesServiceProtocol {
    static let mockFiatCurrencies: FiatCurrencies = [
        .init(symbol: "usd"),
        .init(symbol: "eur"),
        .init(symbol: "aud"),
        .init(symbol: "sgd")
    ]

    func fetchAllFiatCurrencies() async throws -> FiatCurrencies {
        FiatCurrenciesServiceSuccess.mockFiatCurrencies
    }
}
