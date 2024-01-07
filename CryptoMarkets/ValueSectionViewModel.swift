//
//  ValueSectionViewModel.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/7/24.
//

import Foundation

enum ValueModifier: String {
    case trillion = "T"
    case billion = "B"
    case million = "M"
    case none = ""
}

@Observable final class ValueSectionViewModel: ObservableObject {
    
    var value: Decimal
    var percentChange: Decimal
    var valueModifier: ValueModifier
    
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

    
    init(value: Decimal, percentChange: Decimal) {
        self.value = value
        self.percentChange = percentChange
        self.valueModifier = ValueModifier.none
    }
}

