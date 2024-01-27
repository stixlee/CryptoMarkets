//
//  VolumeBackingState.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/27/24.
//

import Foundation

struct VolumeState: CellBackingState  {

    typealias BackingState = QuoteState
    
    let volume: Decimal
    let volumePercentChange: Decimal
    let id = UUID().uuidString
    let type: GenericPanelType = .volume
    
    init(state: BackingState) {
        self.volume = state.volume
        self.volumePercentChange = state.volumePercentChange
    }

    
}

extension VolumeState{
    
    var title: String { return "Trading Volume" }
    var subtitle: String { return "Global Trading Volume  24h" }
    var value: Decimal { return volume }
    var image: String? { return nil }
    var percentChange: Decimal { return volumePercentChange }
    var showInfoButton: Bool { return true }
    
}

