//
//  MarketDataService+MarketCap.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/1/24.
//

import Foundation

extension MarketDataService {
        
    func marketCap() async throws -> (Decimal?, Decimal) {
        do {
            let quoteResponse = try await api.latestQuotes()
            let total = quoteResponse.data.quote.USD.totalMarketCap
            let percentChange = ((quoteResponse.data.quote.USD.totalMarketCap - quoteResponse.data.quote.USD.previousMarketCap) / quoteResponse.data.quote.USD.previousMarketCap)
            return (total.decimalValue ?? 0.0, percentChange.decimalValue ?? 0.0)
        } catch (let error) {
            print("DEBUG: \(error.localizedDescription)")
            return (nil, 0.0)
        }
    }
}
