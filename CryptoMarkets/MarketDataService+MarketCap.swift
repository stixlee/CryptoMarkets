//
//  MarketDataService+MarketCap.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/1/24.
//

import Foundation

extension MarketDataService {
            
    func marketWatch() async throws -> GlobalMarketSnapshot {
        
        do {
            let quoteResponse = try await api.globalMarkets()
            return GlobalMarketSnapshot(from: quoteResponse)
        } catch (let error) {
            print("DEBUG: \(error.localizedDescription)")
            throw error
        }
    }

}
