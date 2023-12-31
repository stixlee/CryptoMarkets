//
//  TrendingViewModel.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 12/31/23.
//

import Foundation

final class TrendingViewModel: ObservableObject {
    let label: String = "Trending"
    let period: String = "last 24h"
    let trendingItems: [CryptoLineItemViewModel] = [
        CryptoLineItemViewModel(),
        CryptoLineItemViewModel(),
        CryptoLineItemViewModel()
    ]
}
