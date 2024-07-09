//
//  FiatCurrenciesServiceFail.swift
//  RealTymeCurrenciesTests
//
//  Created by Triet Le on 9.7.2024.
//

import XCTest
@testable import RealTymeCurrencies

struct FiatCurrenciesServiceFail: FiatCurrenciesServiceProtocol {
    func fetchAllFiatCurrencies() async throws -> FiatCurrencies {
        throw APIError.malformedURLRequest
    }
}
