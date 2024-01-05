//
//  MoversSnapshot.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/4/24.
//

import Foundation

struct MarketItem: Identifiable {
    let id: String
    let symbol: String
    let name: String
    let image: String
    let price: Decimal
    let percentChange: Decimal
    
    init(from response: MarketItemResponse) {
        self.id = response.id
        self.symbol = response.symbol
        self.name = response.name
        self.image = response.image
        self.price = response.currentPrice
        self.percentChange = response.percentPriceChange
    }
}
