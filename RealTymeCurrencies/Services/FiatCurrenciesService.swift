//
//  FiatCurrenciesService.swift
//  RealTymeCurrencies
//
//  Created by Triet Le on 8.7.2024.
//

import Foundation

/// This is dedicated for all use related API
/// Can be extended in future for more calls
protocol FiatCurrenciesServiceProtocol {
    func fetchAllFiatCurrencies() async throws -> FiatCurrencies
}

struct FiatCurrenciesService: FiatCurrenciesServiceProtocol {
    func fetchAllFiatCurrencies() async throws -> FiatCurrencies {
        try await FiatCurrenciesRequest().execute()
    }
}
