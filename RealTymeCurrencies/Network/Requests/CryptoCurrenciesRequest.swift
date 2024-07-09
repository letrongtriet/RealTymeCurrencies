//
//  CryptoCurrenciesRequest.swift
//  RealTymeCurrencies
//
//  Created by Triet Le on 8.7.2024.
//

import Foundation

struct CryptoCurrenciesRequest: APIRequest {
    let fiatCurrency: String
    let sorting: CryptoCurrencySorting
    let limit: Int

    private let path = "/v3/coins/markets"

    func execute() async throws -> Response {
        let urlString = AppPantry.API.cryptoCurrenciesBaseUrl + path
        var components = URLComponents(string: urlString)

        components?.queryItems = [
            URLQueryItem(name: "x_cg_demo_api_key", value: AppPantry.API.demoKey),
            URLQueryItem(name: "vs_currency", value: fiatCurrency),
            URLQueryItem(name: "order", value: sorting.rawValue),
            URLQueryItem(name: "per_page", value: "\(limit)")
        ]

        guard let url = components?.url else {
            throw APIError.malformedURLRequest
        }

        //create a new urlRequest passing the url
        let request = URLRequest(url: url)

        //run the request and retrieve both the data and the response of the call
        let (data, _) = try await URLSession.shared.data(for: request)

        //checks if there are errors regarding the HTTP status code and decodes using the passed struct
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .custom({ decoder in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)
            let formatter = ISO8601DateFormatter()
            formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
            return formatter.date(from: dateString)!
        })
        return try decoder.decode(Response.self, from: data)
    }
}

extension CryptoCurrenciesRequest {
    typealias Response = CryptoCurrencies
}
