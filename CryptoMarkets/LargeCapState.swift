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
    
    var moversState: [CellState] {
        var items: [CellState] = []
        for mover in self.movers {
            items.append(CellState(type: .crypto, moverState: mover))
        }
        return items
    }
    
    var volumeState: [CellState] {
        var items: [CellState] = []
        for item in self.mostTraded {
            items.append(CellState(type: .crypto, moverState: item))
        }
        return items

    }

}
