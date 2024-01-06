//
//  MarketDataService+Movers.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/4/24.
//

import Foundation

extension MarketDataService {
            
    func movers() async throws -> [MarketItem] {
        do {
            let movers = try await api.largeCapBiggestMovers()
            var topFiveMovers: [MarketItem] = []
            for mover in movers {
                topFiveMovers.append(MarketItem(from: mover))
            }
            return topFiveMovers
        } catch (let error) {
            print("DEBUG: \(error.localizedDescription)")
            throw error
        }
    }
}
