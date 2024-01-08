//
//  CryptoPanelViewModel.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/7/24.
//

import Foundation

@Observable final class CryptoPanelViewModel: ObservableObject {
    
    var items: [CryptoPanelItemViewModel]
    var title: String
        
    init() {
        let item1 = CryptoPanelItemViewModel()
        let item2 = CryptoPanelItemViewModel()
        let item3 = CryptoPanelItemViewModel()
        let item4 = CryptoPanelItemViewModel()
        let item5 = CryptoPanelItemViewModel()

        self.items = [item1, item2, item3, item4, item5]
        self.title = "Large Cap Movers"
    }
    
    init(from movers: [MarketItem]) {
        var cryptoItems: [CryptoPanelItemViewModel] = []
        for mover in movers {
            cryptoItems.append(CryptoPanelItemViewModel(from: mover))
        }
        self.title = "Large Cap Movers"
        self.items = cryptoItems
    }
//    init(from snapshot: GlobalMarketSnapshot, title: String) {
//        let marketCapItemViewModel = MarketPanelItemViewModel(
//            title: "Market Cap",
//            secondaryTitle: "Global Market Capitalization",
//            value: snapshot.marketCap, percentChange: snapshot.marketCapPercentChange
//        )
//        let volumeItemViewModel = MarketPanelItemViewModel(
//            title: "Trading Volume",
//            secondaryTitle: "Global Trading Volume  24h",
//            value: snapshot.volume, percentChange: snapshot.volumePercentChange
//        )
//        self.itemViewModels = [marketCapItemViewModel, volumeItemViewModel]
//        self.title = title
//    }
}
