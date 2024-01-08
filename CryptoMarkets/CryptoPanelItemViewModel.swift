//
//  CryptoPanelViewModels.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/7/24.
//

import Foundation

@Observable final class CryptoPanelItemViewModel: ObservableObject, Identifiable {
    
    let id = UUID().uuidString
    var name: String
    var symbol: String
    var imageUrlString: String
    var value: Decimal
    var percentChange: Decimal
    var valueModifier: ValueModifier = ValueModifier.none
    
    private let trillion: Decimal = 1000000000000
    private let billion: Decimal = 1000000000

    var displayValue: Decimal {
        var adjustedValue = value / trillion
        if adjustedValue > 1.0 {
            valueModifier = ValueModifier.trillion
            return adjustedValue
        }
        
        adjustedValue = value / billion
        if adjustedValue > 1.0 {
            valueModifier = ValueModifier.billion
            return adjustedValue
        }
        
        valueModifier = ValueModifier.none
        return value
    }
    
    init(name: String, symbol: String, imageUrlString: String, value: Decimal, percentChange: Decimal) {
        self.name = name
        self.symbol = symbol
        self.imageUrlString = imageUrlString
        self.value = value
        self.percentChange = percentChange
    }
    
    init() {
        self.name = "Bitcoin"
        self.symbol = "BTC"
        self.imageUrlString = ""
        self.value = 43456.23
        self.percentChange = 0.0234
    }
    
    init(from marketItem: MarketItem) {
        self.name = marketItem.name
        self.symbol = marketItem.symbol
        self.imageUrlString = marketItem.image
        self.value = marketItem.price
        self.percentChange = marketItem.percentChange
    }
    
}
