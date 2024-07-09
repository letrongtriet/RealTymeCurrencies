//
//  CryptoCurrenciesService.swift
//  RealTymeCurrencies
//
//  Created by Triet Le on 8.7.2024.
//

import Foundation

/// This is dedicated for all use related API
/// Can be extended in future for more calls
protocol CryptoCurrenciesServiceProtocol {
    func fetchCryptoCurrencies(
        fiatCurrency: String,
        sorting: CryptoCurrencySorting,
        limit: Int
    ) async throws -> CryptoCurrencies
}

struct CryptoCurrenciesService: CryptoCurrenciesServiceProtocol {
    func fetchCryptoCurrencies(
        fiatCurrency: String,
        sorting: CryptoCurrencySorting = .descending,
        limit: Int = 10
    ) async throws -> CryptoCurrencies {
        try await CryptoCurrenciesRequest(
            fiatCurrency: fiatCurrency,
            sorting: sorting,
            limit: limit
        ).execute()
    }
}
