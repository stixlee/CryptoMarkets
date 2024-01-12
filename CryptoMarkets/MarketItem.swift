//
//  MoversSnapshot.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/4/24.
//

import Foundation

struct MarketItem: Identifiable {
    let id: String
    let rank: Int
    let symbol: String
    let name: String
    let image: String
    let price: Decimal
    let percentChange: Decimal
    
    init(from response: MarketItemResponse) {
        self.id = response.id
        self.rank = 1
        self.symbol = response.symbol
        self.name = response.name
        self.image = response.image
        self.price = response.currentPrice
        self.percentChange = response.percentPriceChange / 100.0
    }
    
    init(with response: CoinsMarketsResponse) {
        self.id = response.id
        self.rank = response.marketCapRank
        self.symbol = response.symbol
        self.name = response.name
        self.image = response.image
        self.price = response.currentPrice.decimalValue ?? 0.0
        self.percentChange = (response.priceChangePercentage24h.decimalValue ?? 0.0) / 100.0
    }

}
