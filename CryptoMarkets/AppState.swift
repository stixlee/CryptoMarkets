//
//  AppState.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/1/24.
//

import SwiftUI

enum Tabs: Int {
    case unknown
    case markets
    case crypto
    case watchlist
    case intelligence
    case profile
}

let appState = AppState()
@Observable final class AppState: ObservableObject {
    var currentTab: Tabs = .markets
    var latestQuote: QuoteState = QuoteState()
    var largeCapMovers: LargeCapMoversState = LargeCapMoversState(movers: [])
}

extension AppState {
    
    var marketPanelState: [GenericPanelState] {
        return [
            GenericPanelState(type: .marketCap, from: self.latestQuote),
            GenericPanelState(type: .volume, from: self.latestQuote)
        ]
    }
    
    var largeCapMoversPanelState: [GenericPanelState] {
        var movers: [GenericPanelState] = []
        for mover in self.largeCapMovers.movers {
            movers.append(GenericPanelState(with: mover))
        }
        return movers
    }
}
