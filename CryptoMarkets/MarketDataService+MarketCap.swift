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
            let globalMarketCapData = try await api.globalMarketData()
            let total = totalMarketCap(marketCapData: globalMarketCapData.totalMarketCap)
            let percent = globalMarketCapData.marketCapChangePercentage24hUsd
            return (total, percent.decimalValue ?? 0.0)
        } catch (let error) {
            print("DEBUG: \(error.localizedDescription)")
            return (nil, 0.0)
        }
    }
}

private extension MarketDataService {
    
    func totalMarketCap(marketCapData: MarketCapData) -> Decimal? {
        var total: Double = 0.0

        total = total+marketCapData.aed+marketCapData.bch+marketCapData.bnb+marketCapData.btc+marketCapData.dot+marketCapData.eos+marketCapData.eth+marketCapData.link+marketCapData.ltc+marketCapData.usd+marketCapData.xlm+marketCapData.xrp+marketCapData.yfi
//        let children = marketCapData.mirror.children
//        for child in children {
//            if let value = child.value as? Double {
//                total = total + value
//            }
//        }
        return total.decimalValue 
    }
    
    
}
