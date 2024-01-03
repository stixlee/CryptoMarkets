//
//  MarketDataService+Trending.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/3/24.
//

import Foundation

extension MarketDataService {
    func trending() async throws -> TrendingItemsSnapshot {
        do {
            let trendingResponse = try await api.trending()
            return TrendingItemsSnapshot(from: trendingResponse)
        } catch (let error) {
            print("DEBUG: \(error.localizedDescription)")
            throw error
        }
    }

}
