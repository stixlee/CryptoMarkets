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
    var nameSectionViewModel: CryptoNameSectionViewModel
    var valueSectionViewModel: ValueSectionViewModel
    
    init(name: String, symbol: String, imageUrlString: String, value: Decimal, percentChange: Decimal) {
        self.name = name
        self.symbol = symbol
        self.imageUrlString = imageUrlString
        self.value = value
        self.percentChange = percentChange
        self.nameSectionViewModel = CryptoNameSectionViewModel(name: name, symbol: symbol, imageUrlString: imageUrlString, percentChange: percentChange)
        self.valueSectionViewModel = ValueSectionViewModel(value: value, percentChange: percentChange)
    }
    
    init() {
        self.name = "Bitcoin"
        self.symbol = "BTC"
        self.imageUrlString = ""
        self.value = 43456.23
        self.percentChange = 0.0234
        self.nameSectionViewModel = CryptoNameSectionViewModel(name: "Bitcoin", symbol: "BTC", imageUrlString: "", percentChange: 0.0234)
        self.valueSectionViewModel = ValueSectionViewModel(value: 43456.23, percentChange: 0.0234)

    }
    
    init(from marketItem: MarketItem) {
        self.name = marketItem.name
        self.symbol = marketItem.symbol
        self.imageUrlString = marketItem.image
        self.value = marketItem.price
        self.percentChange = marketItem.percentChange
        self.nameSectionViewModel = CryptoNameSectionViewModel(name: marketItem.name, symbol: marketItem.symbol, imageUrlString: marketItem.image, percentChange: marketItem.percentChange)
        self.valueSectionViewModel = ValueSectionViewModel(value: marketItem.price, percentChange: marketItem.percentChange)
    }
    
}
