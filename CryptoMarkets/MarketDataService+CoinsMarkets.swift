//
//  MarketDataService+CoinsMarkets.swift
//  CryptoMarkets
//
//  Created by John Ayres on 1/3/24.
//

import Foundation

extension MarketDataService {
        
    func coinsMarkets() async -> [CoinsMarketsResponse]? {
        do {
            let response = try await api.coinsMarkets()
            return response
        } catch (let error) {
            print("DEBUG: \(error.localizedDescription)")
            return nil
        }
    }
}
