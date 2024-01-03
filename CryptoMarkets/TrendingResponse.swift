//
//  TrendingResponse.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/3/24.
//

import Foundation

struct TrendingResponse: Codable {
    let coins: [TrendingItemResponse]
}

struct TrendingItemResponse: Codable {
    let item: TrendingItem
}

struct TrendingItem: Codable {
    let id: String
    let coinId: Int
    let name: String
    let symbol: String
    let marketCapRank: Int
    let thumbUrlString: String
    let smallUrlString: String
    let largeUrlString: String
    let slug: String
    let score: Int
    let data: TrendingData
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case coinId = "coin_id"
        case name = "name"
        case symbol = "symbol"
        case marketCapRank = "market_cap_rank"
        case thumbUrlString = "thumb"
        case smallUrlString = "small"
        case largeUrlString = "large"
        case slug = "slug"
        case score = "score"
        case data = "data"
    }
}

struct TrendingData: Codable {
    let price: String
}
