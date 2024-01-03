//
//  TrendingSnapshot.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/3/24.
//

import Foundation

struct TrendingItemsSnapshot {
    
    let trendingItems: [TrendingItemSnapshot]
    
    init(from response: TrendingResponse) {
        var trending: [TrendingItemSnapshot] = []
        for item in response.coins {
            trending.append(TrendingItemSnapshot(from: item.item))
        }
        self.trendingItems = trending
    }
}

struct TrendingItemSnapshot {
    
    let id: String
    let name: String
    let symbol: String
    let price: String
    
    init(from trendingItem: TrendingItem) {
        self.id = trendingItem.id
        self.name = trendingItem.name
        self.symbol = trendingItem.symbol
        self.price = trendingItem.data.price
    }
}


