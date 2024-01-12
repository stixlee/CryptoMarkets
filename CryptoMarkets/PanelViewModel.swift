//
//  PanelViewModel.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/11/24.
//

import Foundation

@Observable final class PanelViewModel: ObservableObject {
    
    var title: String
    var items: [PanelItemViewModel]
    
    init(title: String, items: [PanelItemViewModel]) {
        self.title = title
        self.items = items
    }
    
    init() {
        self.title = "Market Snapshot"
        self.items = [
            PanelItemViewModel(),
            PanelItemViewModel(
                title: "Trading Volume",
                subtitle: "Global Trading Volume  24h",
                image: "",
                value: 78400000000,
                percentChange: 0.0567
            )
        ]
    }
    
    init(from snapshot: GlobalMarketSnapshot) {
        self.title = "Market Snapshot"
        self.items = [
            PanelItemViewModel(
                title: "Market Cap",
                subtitle: "Global Global Market Capitalizatioon",
                image: "",
                value: snapshot.marketCap,
                percentChange: snapshot.marketCapPercentChange
            ),
            PanelItemViewModel(
                title: "Trading Volume",
                subtitle: "Global Trading Volume  24h",
                image: "",
                value: snapshot.volume,
                percentChange: snapshot.volumePercentChange
            )
        ]
    }
    
    func firstItems() -> [PanelItemViewModel] {
        var viewModels: [PanelItemViewModel] = []
        for item in items {
            if item.id != items.last?.id ?? "" {
                viewModels.append(item)
            }
        }
        return viewModels
    }
    
    func lastItem() -> PanelItemViewModel? {
        return items.last
    }

}
