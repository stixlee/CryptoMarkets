//
//  MarketWatchViewModel.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 12/31/23.
//

import Foundation

final class MarketwatchCompositeViewModel: ObservableObject {
    var marketCapViewModel: MarketCapViewModel = MarketCapViewModel()
    var marketVolumeViewModel: MarketVolumeViewModel = MarketVolumeViewModel()
    var trendingViewModel: TrendingViewModel = TrendingViewModel()
}
