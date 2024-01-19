//
//  CryptoCellViewModel.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/12/24.
//

import Foundation

@Observable final class CryptoCellViewModel: ObservableObject, Identifiable {
    
    let id: String
    var rank: Int
    var imageURL: String
    var symbol: String
    var price: Decimal
    var percentDelta: Decimal
    var showMenu: Bool = false
    
    init(rank: Int, imageURL: String, symbol: String, price: Decimal, percentDelta: Decimal) {
        self.id = ""
        self.rank = rank
        self.imageURL = imageURL
        self.symbol = symbol
        self.price = price
        self.percentDelta = percentDelta
    }
    
    init() {
        self.id = ""
        self.rank = 1
        self.imageURL = ""
        self.symbol = "BTC"
        self.price = 43345.56
        self.percentDelta = 0.0078

    }
    
    init(from marketItem: MarketItem) {
        self.id = marketItem.id
        self.rank = marketItem.rank
        self.imageURL = marketItem.image
        self.symbol = marketItem.symbol
        self.price = marketItem.price
        self.percentDelta = marketItem.percentChange
    }

}
