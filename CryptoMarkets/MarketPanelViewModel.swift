//
//  MarketPanelViewModel.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/7/24.
//

import Foundation

@Observable final class MarketPanelViewModel: ObservableObject {
    
    var itemViewModels: [MarketPanelItemViewModel]
    
    init(itemViewModels: [MarketPanelItemViewModel]) {
        self.itemViewModels = itemViewModels
    }
}
