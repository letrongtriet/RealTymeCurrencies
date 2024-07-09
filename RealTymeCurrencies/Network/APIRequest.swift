//
//  APIRequest.swift
//  RealTymeCurrencies
//
//  Created by Triet Le on 8.7.2024.
//

import Foundation

protocol APIRequest {
    associatedtype Response: Decodable

    func execute() async throws -> Response
}
