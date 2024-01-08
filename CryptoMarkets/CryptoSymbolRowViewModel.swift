//
//  CryptoTitleView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/7/24.
//

import Foundation

@Observable final class CryptoSymbolRowViewModel: ObservableObject {
    var symbol: String
    var imageUrlString: String
    var percentChange: Decimal
    
    init(symbol: String, imageUrlString: String, percentChange: Decimal) {
        self.symbol = symbol
        self.imageUrlString = imageUrlString
        self.percentChange = percentChange
    }
    
    init() {
        self.symbol = "BTC"
        self.imageUrlString = ""
        self.percentChange = 0.0234
    }
}

extension CryptoSymbolRowViewModel {
    var isPositive: Bool { return percentChange >= 0.0 }
}
