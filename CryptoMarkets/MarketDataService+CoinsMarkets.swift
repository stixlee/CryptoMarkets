//
//  MarketDataService+CoinsMarkets.swift
//  CryptoMarkets
//
//  Created by John Ayres on 1/3/24.
//

import Foundation

extension MarketDataService {
        
    func coinsMarkets() async throws -> [MarketItem] {
        var marketItems: [MarketItem] = []
        do {
            let response = try await api.fetchCoins()
            for item in response {
                marketItems.append(MarketItem(with: item))
            }
            return marketItems
        } catch (let error) {
            throw error
        }
    }
}
