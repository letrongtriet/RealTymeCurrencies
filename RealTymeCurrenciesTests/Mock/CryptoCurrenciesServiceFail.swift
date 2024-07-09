//
//  CryptoCurrenciesServiceFail.swift
//  RealTymeCurrenciesTests
//
//  Created by Triet Le on 9.7.2024.
//

import XCTest
@testable import RealTymeCurrencies

struct CryptoCurrenciesServiceFail: CryptoCurrenciesServiceProtocol {
    func fetchCryptoCurrencies(
        fiatCurrency: String,
        sorting: CryptoCurrencySorting = .descending,
        limit: Int = 10
    ) async throws -> CryptoCurrencies {
        throw APIError.malformedURLRequest
    }
}
