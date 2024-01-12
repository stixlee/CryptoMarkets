//
//  PanelItemView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/11/24.
//

import Foundation

@Observable final class PanelItemViewModel: ObservableObject, Identifiable {
    
    let id = UUID().uuidString
    var title: String
    var subtitle: String
    var image: String
    var value: Decimal
    var percentChange: Decimal
    var valueModifier: ValueModifier = .none
    
    init(title: String, subtitle: String, image: String, value: Decimal, percentChange: Decimal) {
        self.title = title
        self.subtitle = subtitle
        self.value = value
        self.percentChange = percentChange
        self.image = image
    }
    
    init() {
        self.title = "Market Cap"
        self.subtitle = "Global Market Capitalization"
        self.value = 1712000000000
        self.percentChange = 0.0076
        self.image = ""
    }
}

extension PanelItemViewModel {
    

    var displayValue: Decimal {
        let trillion: Decimal = 1000000000000
        let billion: Decimal = 1000000000

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

    
    func didTapInfo() {
        print("INFO: didTapInfo")
    }

}
