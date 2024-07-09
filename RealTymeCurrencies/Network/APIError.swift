//
//  APIError.swift
//  RealTymeCurrencies
//
//  Created by Triet Le on 8.7.2024.
//

import Foundation

enum APIError: CustomNSError {
    case malformedURLRequest
    case error(Error)
}
