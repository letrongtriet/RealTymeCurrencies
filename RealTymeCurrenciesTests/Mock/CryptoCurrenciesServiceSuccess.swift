//
//  CryptoCurrenciesServiceSuccess.swift
//  RealTymeCurrenciesTests
//
//  Created by Triet Le on 9.7.2024.
//

import XCTest
@testable import RealTymeCurrencies

struct CryptoCurrenciesServiceSuccess: CryptoCurrenciesServiceProtocol {
    static let mockCryptoCurrencies: CryptoCurrencies = [
        .init(
            id: "bitcoin",
            symbol: "btc",
            name: "Bitcoin",
            image: URL(string: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400")!,
            currentPrice: 11.5,
            high24H: 12,
            low24H: 10,
            lastUpdated: .now
        ),
        .init(
            id: "ethereum",
            symbol: "eth",
            name: "Ethereum",
            image: URL(string: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400")!,
            currentPrice: 11.5,
            high24H: 12,
            low24H: 10,
            lastUpdated: .now
        )
    ]

    func fetchCryptoCurrencies(
        fiatCurrency: String,
        sorting: CryptoCurrencySorting = .descending,
        limit: Int = 10
    ) async throws -> CryptoCurrencies {
        CryptoCurrenciesServiceSuccess.mockCryptoCurrencies
    }
}
