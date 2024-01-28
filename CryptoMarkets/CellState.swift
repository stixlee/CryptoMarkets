//
//  CellState.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/27/24.
//

import Foundation

struct CellState: Identifiable, Hashable {
    
    var id: String = UUID().uuidString
    var title: String
    var subtitle: String
    var image: String?
    var value: Decimal
    var percentChange: Decimal
    var showInfoButton: Bool
    var type: CellType
    
    init(title: String,
         subtitle: String,
         image: String? = nil,
         value: Decimal,
         percentChange: Decimal,
         showInfoButton: Bool,
         type: CellType
    ) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.value = value
        self.percentChange = percentChange
        self.showInfoButton = showInfoButton
        self.type = type
    }
    
    init(type: CellType, marketState: MarketState) {
        self.image = nil
        self.type = type
        self.showInfoButton = true
        if type == .marketCap {
            self.title = "Market Cap"
            self.subtitle = "Global Market Capitalization"
            self.value = marketState.marketCap
            self.percentChange = marketState.marketCapPercentChange
        } else {
            self.title = "Trading Volume"
            self.subtitle = "Global Trading Volume  24h"
            self.value = marketState.volume
            self.percentChange = marketState.volumePercentChange
        }
    }
    
    init(type: CellType, moverState: GenericPanelState) {
        self.image = moverState.image
        self.type = type
        self.showInfoButton = false
        if type == .crypto {
            self.title = moverState.title
            self.subtitle = moverState.subtitle
            self.value = moverState.value
            self.percentChange = moverState.percentChange
        } else {
            self.title = "Trading Volume"
            self.subtitle = "Global Trading Volume  24h"
            self.value = 0.0
            self.percentChange = 0.0
        }
    }

}

enum CellType {
    case marketCap
    case volume
    case crypto
}
