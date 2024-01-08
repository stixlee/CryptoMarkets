//
//  MarketPanelViewModel.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/7/24.
//

import Foundation

@Observable final class MarketPanelViewModel: ObservableObject {
    
    var itemViewModels: [MarketPanelItemViewModel]
    var title: String
        
    init() {
        let marketCapItemViewModel = MarketPanelItemViewModel(
            title: "Market Cap",
            secondaryTitle: "Global Market Capitalization",
            value: 0.0, percentChange: 0.0
        )
        
        let volumeItemViewModel = MarketPanelItemViewModel(
            title: "Trading Volume",
            secondaryTitle: "Global Trading Volume  24h",
            value: 0.0, percentChange: 0.0
        )
        
        self.itemViewModels = [marketCapItemViewModel, volumeItemViewModel]
        self.title = "Market Snapshot"
    }
    
    init(from snapshot: GlobalMarketSnapshot, title: String) {
        let marketCapItemViewModel = MarketPanelItemViewModel(
            title: "Market Cap",
            secondaryTitle: "Global Market Capitalization",
            value: snapshot.marketCap, percentChange: snapshot.marketCapPercentChange
        )
        let volumeItemViewModel = MarketPanelItemViewModel(
            title: "Trading Volume",
            secondaryTitle: "Global Trading Volume  24h",
            value: snapshot.volume, percentChange: snapshot.volumePercentChange
        )
        self.itemViewModels = [marketCapItemViewModel, volumeItemViewModel]
        self.title = title
    }
}
