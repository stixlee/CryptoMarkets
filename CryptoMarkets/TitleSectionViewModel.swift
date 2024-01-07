//
//  TitleSectionViewModel.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/7/24.
//

import Foundation

@Observable final class TitleSectionViewModel: ObservableObject {
    
    let titleRowViewModel: TitleRowViewModel
    let secondaryTitle: String
    let title: String
    let percentChange: Decimal
    
    init(title: String, secondaryTitle: String, percentChange: Decimal) {
        self.secondaryTitle = secondaryTitle
        self.title = title
        self.percentChange = percentChange
        self.titleRowViewModel = TitleRowViewModel(title: title, percentChange: percentChange)
    }
}
