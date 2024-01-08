//
//  QuoteResponse.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/2/24.
//

import Foundation

struct QuoteResponse: Codable {
    let status: StatusResponse
    let data: QuoteDataResponse
}

struct StatusResponse: Codable {
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

struct QuoteDataResponse: Codable {
    let activeCryptoCurrencies: Int
    let quote: QuoteLineItem
    
    enum CodingKeys: String, CodingKey {
        case activeCryptoCurrencies = "active_cryptocurrencies"
        case quote = "quote"
    }
}

struct QuoteLineItem: Codable {
    let USD: UsdQuote
}

struct UsdQuote: Codable {
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

