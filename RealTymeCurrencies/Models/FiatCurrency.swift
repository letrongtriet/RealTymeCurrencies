//
//  FiatCurrency.swift
//  RealTymeCurrencies
//
//  Created by Triet Le on 8.7.2024.
//

import Foundation

// MARK: - FiatCurrenciesResponse
struct FiatCurrenciesResponse: Codable {
    let fiatCurrencies: [FiatCurrency]

    enum CodingKeys: String, CodingKey {
        case fiatCurrencies = "data"
    }
}

// MARK: - Datum
struct FiatCurrency: Codable, Equatable {
    let symbol: String

    enum CodingKeys: String, CodingKey {
        case symbol = "id"
    }
}

typealias FiatCurrencies = [FiatCurrency]
