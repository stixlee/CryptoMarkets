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
    var titleSectionViewModel: TitleSectionViewModel
    var valueSectionViewModel: ValueSectionViewModel
    
    init(title: String, secondaryTitle: String, value: Decimal, percentChange: Decimal) {
        self.title = title
        self.secondaryTitle = secondaryTitle
        self.value = value
        self.percentChange = percentChange
        self.titleSectionViewModel = TitleSectionViewModel(title: title, secondaryTitle: secondaryTitle, percentChange: percentChange)
        self.valueSectionViewModel = ValueSectionViewModel(value: value, percentChange: percentChange)
    }
    
}
