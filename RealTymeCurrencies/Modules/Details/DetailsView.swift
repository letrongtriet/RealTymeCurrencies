//
//  DetailsView.swift
//  RealTymeCurrencies
//
//  Created by Triet Le on 8.7.2024.
//

import SwiftUI

struct DetailsView: View {
    let currency: CryptoCurrency
    let fiatCurrency: String

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    AsyncCachedImage(url: currency.image) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 64, height: 64)
                    } placeholder: {
                        ProgressView()
                    }
                    Spacer()
                }

                Text("Symbol \(currency.symbol.uppercased())")

                Text("Highest price \(currency.high24H, specifier: "%.2f") \(fiatCurrency.uppercased())")

                Text("Lowest price \(currency.low24H, specifier: "%.2f") \(fiatCurrency.uppercased())")

                Text("Last update time \(currency.lastUpdated.formatted(date: .abbreviated, time: .complete))")

                Spacer()
            }
            .padding(.horizontal, 16)
            .navigationTitle(currency.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    DetailsView(
        currency: .init(
            id: "bitcoin",
            symbol: "btc",
            name: "Bitcoin",
            image: URL(string: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400")!,
            currentPrice: 11.5,
            high24H: 12,
            low24H: 10,
            lastUpdated: .now
        ), 
        fiatCurrency: "usd"
    )
}
