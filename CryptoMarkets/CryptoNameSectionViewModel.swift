//
//  CryptoNameSectionViewModel.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/7/24.
//

import Foundation

@Observable final class CryptoNameSectionViewModel: ObservableObject {
    
    let nameRowViewModel: CryptoNameRowViewModel
    let symbolRowViewModel: CryptoSymbolRowViewModel
    let percentChange: Decimal
    
    init(name: String, symbol: String, imageUrlString: String, percentChange: Decimal) {
        self.nameRowViewModel = CryptoNameRowViewModel(name: name, percentChange: percentChange)
        self.symbolRowViewModel = CryptoSymbolRowViewModel(symbol: symbol, imageUrlString: imageUrlString, percentChange: percentChange)
        self.percentChange = percentChange
    }
    
    init() {
        self.nameRowViewModel = CryptoNameRowViewModel(name: "Bitcoin", percentChange: 0.0234)
        self.symbolRowViewModel = CryptoSymbolRowViewModel(symbol: "BTC", imageUrlString: "", percentChange: 0.0234)
        self.percentChange = 0.0234
    }
}

