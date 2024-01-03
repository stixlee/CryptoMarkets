//
//  MarketVolumeViewModel.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 12/31/23.
//

import Foundation

@Observable final class MarketVolumeViewModel: ObservableObject {
    
    var tradingVolume: Decimal = 0.0
    var volumeChange: Decimal = 0.0
    
    init(from snapshot: GlobalMarketSnapshot) {
        self.tradingVolume = snapshot.volume
        self.volumeChange = snapshot.volumePercentChange
    }

    init() {
        self.tradingVolume = 0.0
        self.tradingVolume = 0.0
    }

}
