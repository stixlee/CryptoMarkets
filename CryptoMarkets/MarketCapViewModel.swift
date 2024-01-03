//
//  MarketCapInfoViewModel.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 12/31/23.
//

import Foundation

@Observable final class MarketCapViewModel: ObservableObject {
    
    var marketCap: Decimal = 0.0
    var percentChange: Decimal = 0.0
    
    init(from snapshot: GlobalMarketSnapshot) {
        self.marketCap = snapshot.marketCap
        self.percentChange = snapshot.marketCapPercentChange
    }
    
    init() {
        self.marketCap = 0.0
        self.percentChange = 0.0
    }
    
}
