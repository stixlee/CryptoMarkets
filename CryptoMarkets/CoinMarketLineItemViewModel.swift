//
//  CoinMarketLineItemViewModel.swift
//  CryptoMarkets
//
//  Created by John Ayres on 1/5/24.
//

import Foundation

@Observable final class CoinMarketLineItemViewModel: ObservableObject, Equatable, Hashable, Identifiable {
    static func == (lhs: CoinMarketLineItemViewModel, rhs: CoinMarketLineItemViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var id: String = UUID().uuidString
    var rank: Int = 1
    var imageURL: String = "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400"
    var symbol: String = "btc"
    var price: Decimal = 502.32
    var percentDelta: Decimal = 1.62
}
