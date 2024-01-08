//
//  TrendingViewModel.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/3/24.
//

import Foundation

struct TrendingItemViewModel: Identifiable {
    let id: String
    let imageUrlString: String
    let name: String
    let symbol: String
    let price: String
    
    init() {
        self.id = ""
        self.imageUrlString = ""
        self.name = ""
        self.symbol = ""
        self.price = ""

    }
    init(from trendingItemSnapshot: TrendingItemSnapshot) {
        self.id = trendingItemSnapshot.id
        self.imageUrlString = trendingItemSnapshot.imageUrlString
        self.name = trendingItemSnapshot.name
        self.symbol = trendingItemSnapshot.symbol
        self.price = trendingItemSnapshot.price
    }
}

@Observable final class TrendingViewModel: ObservableObject {
    
    let trendingItems: [TrendingItemViewModel]
    let label = "Trending"
    let secondaryLabel = "(top 5 most searched)"
    
    init() { trendingItems = [] }
    
    init(from snapshot: TrendingItemsSnapshot) {
        var trendingViewModels: [TrendingItemViewModel] = []
        if snapshot.trendingItems.count > 5 {
            for index in 0..<5 {
                let item = TrendingItemViewModel(from: snapshot.trendingItems[index])
                trendingViewModels.append(item)
            }
        } else {
            for item in snapshot.trendingItems {
                let item = TrendingItemViewModel(from: item)
                trendingViewModels.append(item)
            }
        }
        self.trendingItems = trendingViewModels
    }
    
}
