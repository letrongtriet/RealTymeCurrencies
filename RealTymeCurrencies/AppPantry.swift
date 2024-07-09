//
//  AppPantry.swift
//  RealTymeCurrencies
//
//  Created by Triet Le on 8.7.2024.
//

import Foundation

// Where all basic generic properties of the app
// e.g, base url
struct AppPantry {
    struct API {
        static let fiatCurrenciesBaseUrl = "https://api.coinbase.com"
        static let cryptoCurrenciesBaseUrl = "https://api.coingecko.com/api"

        static let demoKey = "CG-haQwUKZnEYaYppBo2Dt58ty9"
    }
}
