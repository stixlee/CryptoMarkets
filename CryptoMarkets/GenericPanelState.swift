//
//  PanelState.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/20/24.
//

import Foundation

enum PanelType {
    case market
    case largeCapMovers
    case mostTraded
}

enum ValueModifier: String {
    case trillion = "T"
    case billion = "B"
    case million = "M"
    case none = ""
}

@Observable class GenericPanelState: ObservableObject, Identifiable {
    let id: String = UUID().uuidString
    let type: PanelType
    let title: String
    let subtitle: String
    let image: String
    let value: Decimal
    let percentChange: Decimal
    let showInfo: Bool
    
//    init(type: PanelType, from quote: MarketState, image: String = "") {
//        self.type = type
//        switch type {
//        case .market:
//            self.title = "Market Cap"
//            self.subtitle = "Global Market Capitalization"
//            self.image = ""
//            self.value = quote.marketCap
//            self.percentChange = quote.marketCapPercentChange
//            self.showInfo = true
//        case .volume:
//            self.title = "Trading Volume"
//            self.subtitle = "Global Trading Volume  24h"
//            self.image = ""
//            self.value = quote.volume
//            self.percentChange = quote.volumePercentChange
//            self.showInfo = true
//        case .largeCapMovers:
//            self.title = ""
//            self.subtitle = ""
//            self.image = ""
//            self.value = 0.0
//            self.percentChange = 0.0
//            self.showInfo = false
//
//        }
//        
//    }
    
    init() {
        self.type = .market
        self.title = "Market Cap"
        self.subtitle = "Global Market Capitalization"
        self.image = ""
        self.value = 1234000000000
        self.percentChange = 0.0023
        self.showInfo = true
    }

    init(type: PanelType = .largeCapMovers,
         with cryptoSummary: CryptoSummary) {
        self.type = .largeCapMovers
        self.title = cryptoSummary.name
        self.subtitle = cryptoSummary.symbol
        self.image = cryptoSummary.image
        self.value = cryptoSummary.currentPrice
        self.percentChange = cryptoSummary.percentPriceChange / 100.0
        self.showInfo = false
    }
    
    init(isCrypto: Bool) {
        if isCrypto {
            self.type = .largeCapMovers
            self.title = ""
            self.subtitle = ""
            self.image = ""
            self.value = 0.0
            self.percentChange = 0.0
            self.showInfo = false
        } else {
            self.type = .market
            self.title = "Market Cap"
            self.subtitle = "Global Market Capitalization"
            self.image = ""
            self.value = 1234000000000
            self.percentChange = 0.0023
            self.showInfo = true
        }
    }
    
    

}

extension GenericPanelState {
    
    var valueModifer: ValueModifier {
        let trillion: Decimal = 1000000000000
        let billion: Decimal = 1000000000

        var adjustedValue = value / trillion
        if adjustedValue > 1.0 {
            return ValueModifier.trillion
        }
        
        adjustedValue = value / billion
        if adjustedValue > 1.0 {
            return ValueModifier.billion
        }
        
        return ValueModifier.none
    }
    var displayValue: Decimal {
        let trillion: Decimal = 1000000000000
        let billion: Decimal = 1000000000

        var adjustedValue = value / trillion
        if adjustedValue > 1.0 {
            return adjustedValue
        }
        
        adjustedValue = value / billion
        if adjustedValue > 1.0 {
            return adjustedValue
        }
        return value
    }
}

