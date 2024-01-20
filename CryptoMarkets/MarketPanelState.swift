//
//  PanelState.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/20/24.
//

import Foundation

enum PanelType: String {
    case marketCap = "Market Cap"
    case volume = "Trading Volume"
}

enum ValueModifier: String {
    case trillion = "T"
    case billion = "B"
    case million = "M"
    case none = ""
}

@Observable class MarketPanelState: ObservableObject {
    let type: PanelType
    let title: String
    let subtitle: String
    let image: String
    let value: Decimal
    let percentChange: Decimal
    let showInfo: Bool
    
    init(type: PanelType, from quote: QuoteState, image: String = "") {
        self.type = type
        switch type {
        case .marketCap:
            self.title = "Market Cap"
            self.subtitle = "Global Market Capitalization"
            self.image = ""
            self.value = quote.marketCap
            self.percentChange = quote.marketCapPercentChange
            self.showInfo = true
        case .volume:
            self.title = "Trading Volume"
            self.subtitle = "Global Trading Volume  24h"
            self.image = ""
            self.value = quote.volume
            self.percentChange = quote.volumePercentChange
            self.showInfo = true
        }
    }
    
    init() {
        self.type = .marketCap
        self.title = "Market Cap"
        self.subtitle = "Global Market Capitalization"
        self.image = ""
        self.value = 1234000000000
        self.percentChange = 0.0023
        self.showInfo = true
    }

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
//            valueModifier = ValueModifier.trillion
            return adjustedValue
        }
        
        adjustedValue = value / billion
        if adjustedValue > 1.0 {
//            valueModifier = ValueModifier.billion
            return adjustedValue
        }
        
//        valueModifier = ValueModifier.none
        return value
    }

}
