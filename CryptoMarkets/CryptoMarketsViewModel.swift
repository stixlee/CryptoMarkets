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
    
    func updateItems(with coinsMarkets: [CoinsMarketsResponse]?) {
        coinsMarketsItems.removeAll()
        
        if let coinsMarkets = coinsMarkets {
            for coinsMarket in coinsMarkets {
                let newItem = CoinMarketLineItemViewModel()
                newItem.rank = coinsMarket.marketCapRank
                newItem.imageURL = coinsMarket.image
                newItem.symbol = coinsMarket.symbol
                newItem.price = Decimal(coinsMarket.currentPrice)
                newItem.percentDelta = Decimal(coinsMarket.priceChangePercentage24h)
                coinsMarketsItems.append(newItem)
            }
        } 
    }
}
