//
//  FiatCurrenciesRequest.swift
//  RealTymeCurrencies
//
//  Created by Triet Le on 8.7.2024.
//

import Foundation

struct FiatCurrenciesRequest: APIRequest {
    private let path = "/v2/currencies"

    func execute() async throws -> Response {
        let urlString = AppPantry.API.fiatCurrenciesBaseUrl + path
        let url = URL(string: urlString)

        guard let url else {
            throw APIError.malformedURLRequest
        }

        //create a new urlRequest passing the url
        let request = URLRequest(url: url)

        //run the request and retrieve both the data and the response of the call
        let (data, _) = try await URLSession.shared.data(for: request)

        //checks if there are errors regarding the HTTP status code and decodes using the passed struct
        let response = try JSONDecoder().decode(FiatCurrenciesResponse.self, from: data)
        return response.fiatCurrencies
    }
}

extension FiatCurrenciesRequest {
    typealias Response = FiatCurrencies
}
