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
    var isLargeCapMoversExpanded: Bool = false
    var latestQuote: QuoteState = QuoteState()
    var largeCap: LargeCapState = LargeCapState()
}
