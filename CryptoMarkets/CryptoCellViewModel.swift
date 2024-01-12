//
//  CryptoCellViewModel.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/12/24.
//

import Foundation

@Observable final class CryptoCellViewModel: ObservableObject, Identifiable {
    
    let id: String = UUID().uuidString
    var rank: Int
    var imageURL: String
    var symbol: String
    var price: Decimal
    var percentDelta: Decimal
    
    init(rank: Int, imageURL: String, symbol: String, price: Decimal, percentDelta: Decimal) {
        self.rank = rank
        self.imageURL = imageURL
        self.symbol = symbol
        self.price = price
        self.percentDelta = percentDelta
    }
    
    init() {
        self.rank = 1
        self.imageURL = ""
        self.symbol = "BTC"
        self.price = 43345.56
        self.percentDelta = 0.0078

    }
    
    init(from marketItem: MarketItem) {
        self.rank = marketItem.rank
        self.imageURL = marketItem.image
        self.symbol = marketItem.symbol
        self.price = marketItem.price
        self.percentDelta = marketItem.percentChange
    }

}
