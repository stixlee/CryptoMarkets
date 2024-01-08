//
//  CryptoPanelViewModel.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/7/24.
//

import Foundation

@Observable final class CryptoPanelViewModel: ObservableObject {
    
    var viewModels: [CryptoPanelItemViewModel]
    var title: String
        
    init() {
        let item1 = CryptoPanelItemViewModel()
        let item2 = CryptoPanelItemViewModel()
        let item3 = CryptoPanelItemViewModel()

        self.viewModels = [item1, item2, item3]
        self.title = "Large Cap Movers"
    }
    
    init(from movers: [MarketItem]) {
        var cryptoItems: [CryptoPanelItemViewModel] = []
        for mover in movers {
            cryptoItems.append(CryptoPanelItemViewModel(from: mover))
        }
        self.title = "Large Cap Movers"
        self.viewModels = cryptoItems
    }
    
    func firstItems() -> [CryptoPanelItemViewModel] {
        var items: [CryptoPanelItemViewModel] = []
        for index in 0..<viewModels.count-1 {
            items.append(viewModels[index])
        }
        return items
    }
    
    func lastItem() -> CryptoPanelItemViewModel {
        return viewModels[viewModels.count-1]
    }

}
