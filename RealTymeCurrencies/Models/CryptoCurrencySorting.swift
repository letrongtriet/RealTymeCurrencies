//
//  CryptoCurrencySorting.swift
//  RealTymeCurrencies
//
//  Created by Triet Le on 8.7.2024.
//

import Foundation

enum CryptoCurrencySorting: String {
    case descending = "market_cap_desc"
    case ascening = "market_cap_asc"
    case volumeDescending = "volume_desc"
    case volumeAscending = "volume_asc"
    case idDescending = "id_desc"
    case idAscending = "id_asc"
}
