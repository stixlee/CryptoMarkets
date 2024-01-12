//
//  CryptoMarketsViewModel.swift
//  CryptoMarkets
//
//  Created by John Ayres on 1/5/24.
//

import Foundation

@Observable final class CryptoMarketsViewModel: ObservableObject {
    var coinsMarketsItems: [CoinMarketLineItemViewModel] = [CoinMarketLineItemViewModel(),
                                                            CoinMarketLineItemViewModel(),
                                                            CoinMarketLineItemViewModel()]
    
    func updateItems(with coinsMarkets: [MarketItem]) {
        coinsMarketsItems.removeAll()
        
        for coinsMarket in coinsMarkets {
            let newItem = CoinMarketLineItemViewModel()
            newItem.rank = coinsMarket.rank
            newItem.imageURL = coinsMarket.image
            newItem.symbol = coinsMarket.symbol
            newItem.price = coinsMarket.price
            newItem.percentDelta = coinsMarket.percentChange
            coinsMarketsItems.append(newItem)
        }
    }
}
