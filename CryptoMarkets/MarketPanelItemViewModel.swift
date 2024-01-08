//
//  MarketPanelViewModel.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/7/24.
//

import Foundation

@Observable final class MarketPanelItemViewModel: ObservableObject, Identifiable {
    
    let id = UUID().uuidString
    var title: String
    var secondaryTitle: String
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

    
    init(title: String, secondaryTitle: String, value: Decimal, percentChange: Decimal) {
        self.title = title
        self.secondaryTitle = secondaryTitle
        self.value = value
        self.percentChange = percentChange
    }
    
}

extension MarketPanelItemViewModel {
    var isPositive: Bool { return percentChange >= 0.0 }
}

extension MarketPanelItemViewModel {
    func didTapInfo() {
        print("DEBUG: didTapInfo")
    }
}

