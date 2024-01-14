//
//  PanelItemView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/11/24.
//

import Foundation

enum ValueModifier: String {
    case trillion = "T"
    case billion = "B"
    case million = "M"
    case none = ""
}

final class PanelItemViewModel: ObservableObject, Identifiable {
    
    let id = UUID().uuidString
    
    @Published var value: Decimal
    @Published var percentChange: Decimal

    var title: String
    var subtitle: String
    var image: String
    var valueModifier: ValueModifier = .none
    var showInfoButton: Bool
    
    init(title: String, subtitle: String, image: String, value: Decimal, percentChange: Decimal, showInfoButton: Bool) {
        self.title = title
        self.subtitle = subtitle
        self.value = value
        self.percentChange = percentChange
        self.image = image
        self.showInfoButton = showInfoButton
    }
    
    init() {
        self.title = "Market Cap"
        self.subtitle = "Global Market Capitalization"
        self.value = 1712000000000
        self.percentChange = 0.0076
        self.image = ""
        self.showInfoButton = true
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
