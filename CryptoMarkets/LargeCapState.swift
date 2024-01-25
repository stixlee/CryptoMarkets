//
//  LargeCapMoversState.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/22/24.
//

import SwiftUI

@Observable final class LargeCapState: ObservableObject {
    var movers: [GenericPanelState]
    var mostTraded: [GenericPanelState]
    
    init(topMovers: [CryptoSummary], mostTraded: [CryptoSummary]) {
        self.movers = []
        self.mostTraded = []
        for item in topMovers {
            movers.append(GenericPanelState(with: item))
        }
        for item in mostTraded {
            movers.append(GenericPanelState(with: item))
        }

    }
    
    init() {
        self.movers = []
        self.mostTraded = []
    }
}
