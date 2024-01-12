//
//  MarketWatchViewModel.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 12/31/23.
//

import Foundation

@Observable final class MarketwatchCompositeViewModel: ObservableObject {
//    var trendingViewModel: TrendingViewModel = TrendingViewModel()
//    var leadingIndicatorsViewModel: LeadingIndicatorsViewModel = LeadingIndicatorsViewModel()
    var largeCapMoversViewModel: PanelViewModel = PanelViewModel(
        title: "Large Cap Movers",
        items: [
            PanelItemViewModel(
                title: "Bitcoin",
                subtitle: "BTC",
                image: "",
                value: 0,
                percentChange: 0
            ),
            PanelItemViewModel(
                title: "Ethereum",
                subtitle: "ETH",
                image: "",
                value: 0,
                percentChange: 0
            )
        ]
    )
    var marketSnapshotViewModel: PanelViewModel = PanelViewModel(
        title: "Market Snapshot",
        items: [
            PanelItemViewModel(
                title: "Market Cap",
                subtitle: "Global Market Capitlization",
                image: "",
                value: 0,
                percentChange: 0
            ),
            PanelItemViewModel(
                title: "Trading Volume",
                subtitle: "Global Trading Volume  24h",
                image: "",
                value: 0,
                percentChange: 0
            )
        ]
    )
}
