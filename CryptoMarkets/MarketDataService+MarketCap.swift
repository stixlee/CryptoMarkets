//
//  MarketDataService+MarketCap.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/1/24.
//

import Foundation

extension MarketDataService {
        
//    func marketCap() async throws -> (Decimal?, Decimal) {
//        do {
//            let quoteResponse = try await api.latestQuotes()
//            let total = quoteResponse.data.quote.USD.totalMarketCap
//            let marketCapChange = quoteResponse.data.quote.USD.marketCapChange / 100.0
////            let percentChange = ((quoteResponse.data.quote.USD.totalMarketCap - quoteResponse.data.quote.USD.previousMarketCap) / quoteResponse.data.quote.USD.previousMarketCap)
//            return (total.decimalValue ?? 0.0, marketCapChange.decimalValue ?? 0.0)
//        } catch (let error) {
//            print("DEBUG: \(error.localizedDescription)")
//            return (nil, 0.0)
//        }
//    }
    
    func marketWatch() async throws -> GlobalMarketSnapshot {
        
        do {
            let quoteResponse = try await api.latestQuotes()
            return GlobalMarketSnapshot(from: quoteResponse)
        } catch (let error) {
            print("DEBUG: \(error.localizedDescription)")
            throw error
        }
    }

}
