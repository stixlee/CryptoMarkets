//
//  CoinMarketQuote.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/25/24.
//

import SwiftUI

struct CoinMarketResponse: Codable {
    let data: [CoinMarketQuoteInfo]
}

struct CoinMarketQuoteInfo: Codable {
    let id: Int
    let name: String
    let symbol: String
    let slug: String
    let quote: CoinMarketQuote
}

struct CoinMarketQuote: Codable {
    let USD: CoinMarketQuoteItem
    let BTC: CoinMarketQuoteItem
}

struct CoinMarketQuoteItem: Codable {
    let price: Double
    let volume_24h: Int
    let volume_change_24h: Decimal
    let market_cap: Decimal
}
