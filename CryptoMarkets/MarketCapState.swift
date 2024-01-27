//
//  MarketCapState.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/27/24.
//

import Foundation

struct MarketCapState: CellBackingState  {

    typealias BackingState = QuoteState
    
    let marketCap: Decimal
    let marketCapPercentChange: Decimal
    let id = UUID().uuidString
    let type: GenericPanelType = .marketCap
    
    init(state: BackingState) {
        self.marketCap = state.marketCap
        self.marketCapPercentChange = state.marketCapPercentChange
    }

    
}

extension MarketCapState{
    
    var title: String { return "Market Cap" }
    var subtitle: String { return "Global Market Capitalization" }
    var value: Decimal { return marketCap }
    var image: String? { return nil }
    var percentChange: Decimal { return marketCapPercentChange }
    var showInfoButton: Bool { return true }
    
}
