//
//  MarketPanelViewModel.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/7/24.
//

import Foundation

@Observable final class MarketPanelItemViewModel: ObservableObject {
    
    var title: String
    var secondaryTitle: String
    var value: Decimal
    var percentChange: Decimal
    var titleSectionViewModel: TitleSectionViewModel
    
    init(title: String, secondaryTitle: String, value: Decimal, percentChange: Decimal) {
        self.title = title
        self.secondaryTitle = secondaryTitle
        self.value = value
        self.percentChange = percentChange
        self.titleSectionViewModel = TitleSectionViewModel(title: title, secondaryTitle: secondaryTitle, percentChange: percentChange)
    }
    
}
