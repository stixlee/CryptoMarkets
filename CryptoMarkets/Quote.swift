//
//  LatestQuotes.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/19/24.
//

import Foundation

struct Quote: Codable {
    let status: QuoteStatus
    let data: QuoteData
}

struct QuoteStatus: Codable {
    let timestamp: String
    let errorCode: Int
    let errorMessage: String?
    let creditCount: Int?
    let elapsed: Int
    let notice: String?
    
    enum CodingKeys: String, CodingKey {
        case timestamp = "timestamp"
        case errorCode = "error_code"
        case errorMessage = "error_message"
        case creditCount = "credit_count"
        case elapsed = "elapsed"
        case notice = "notice"
    }
}

struct QuoteData: Codable {
    let activeCryptoCurrencies: Int
    let quote: QuoteItem
    
    enum CodingKeys: String, CodingKey {
        case activeCryptoCurrencies = "active_cryptocurrencies"
        case quote = "quote"
    }
}

struct QuoteItem: Codable {
    let USD: Usd
}

struct Usd: Codable {
    let totalMarketCap: Double
    let previousMarketCap: Double
    let totalVolume: Double
    let previousVolume: Double
    let marketCapChange: Double
    let volumeChange: Double
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case previousMarketCap = "total_market_cap_yesterday"
        case totalVolume = "total_volume_24h"
        case previousVolume = "total_volume_24h_yesterday"
        case marketCapChange = "total_market_cap_yesterday_percentage_change"
        case volumeChange = "total_volume_24h_yesterday_percentage_change"
    }
}
