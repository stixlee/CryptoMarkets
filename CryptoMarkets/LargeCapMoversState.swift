//
//  LargeCapMoversState.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/22/24.
//

import SwiftUI

@Observable final class LargeCapMoversState: ObservableObject {
    var movers: [GenericPanelState]
    
    init(cryptoMovers: [CryptoSummary]) {
        self.movers = []
        for mover in cryptoMovers {
            movers.append(GenericPanelState(with: mover))
        }
    }
    
    init() {
        self.movers = []
//        movers.append(GenericPanelState(isCrypto: true))
    }
}
