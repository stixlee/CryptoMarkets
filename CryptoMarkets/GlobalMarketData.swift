//
//  GlobalMarketData.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/1/24.
//

import Foundation

struct GlobalMarketData: Codable {
    let activeCryptocurrencies: Int
    let upcomingIcos: Int
    let ongoingIcos: Int
    let endedIcos: Int
    let markets: Int
    let totalMarketCap: MarketCapData
    let marketCapChangePercentage24hUsd: Double
    let updatedAt: Int
    
    enum CodingKeys: String, CodingKey {
        case activeCryptocurrencies = "active_cryptocurrencies"
        case upcomingIcos = "upcoming_icos"
        case ongoingIcos = "ongoing_icos"
        case endedIcos = "ended_icos"
        case markets = "markets"
        case totalMarketCap = "total_market_cap"
        case marketCapChangePercentage24hUsd = "market_cap_change_percentage_24h_usd"
        case updatedAt = "updated_at"
    }
}
