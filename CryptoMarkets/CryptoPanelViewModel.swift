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

        self.items = [item1, item2, item3]
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
}
