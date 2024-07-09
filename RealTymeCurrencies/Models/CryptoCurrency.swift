//
//  CryptoCurrency.swift
//  RealTymeCurrencies
//
//  Created by Triet Le on 8.7.2024.
//

import Foundation

// MARK: - CryptoCurrency
struct CryptoCurrency: Codable, Equatable {
    let id, symbol, name: String
    let image: URL
    let currentPrice: Double
    let high24H, low24H: Double
    let lastUpdated: Date

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case lastUpdated = "last_updated"
    }
}

typealias CryptoCurrencies = [CryptoCurrency]
