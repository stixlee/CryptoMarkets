//
//  TrendingViewModel.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 12/31/23.
//

import Foundation

final class CryptoListViewModel: ObservableObject {
    
    init(label: String, period: String = "", items: [CryptoLineItemViewModel] = []) {
        self.label = label
        self.period = "last 24h"
        self.items = [
            CryptoLineItemViewModel(),
            CryptoLineItemViewModel(),
            CryptoLineItemViewModel()
        ]
    }
    
    let label: String
    let period: String
    let items: [CryptoLineItemViewModel]
}
