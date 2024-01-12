//
//  CryptoMarketsViewModel.swift
//  CryptoMarkets
//
//  Created by John Ayres on 1/5/24.
//

import Foundation

@Observable final class CryptoMarketsViewModel: ObservableObject {
    
    var viewModels: [CryptoCellViewModel]
    
    init() {
        self.viewModels = []
    }
//    var coinsMarketsItems: [CoinMarketLineItemViewModel] = [CoinMarketLineItemViewModel(),
//                                                            CoinMarketLineItemViewModel(),
//                                                            CoinMarketLineItemViewModel()]
    
    func updateItems(with coinsMarkets: [MarketItem]) {
        
        var loadedItems: [CryptoCellViewModel] = []
        
        for marketItem in coinsMarkets {
            loadedItems.append(CryptoCellViewModel(from: marketItem))
        }
        
        self.viewModels = loadedItems
        
        
    }
}
