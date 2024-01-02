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
    
}
