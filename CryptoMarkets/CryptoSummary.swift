//
//  CryptoSummary.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/22/24.
//

import SwiftUI

struct CryptoSummary: Codable {
    
    let id: String
    let symbol: String
    let name: String
    let image: String
    let currentPrice: Decimal
    let marketCap: Decimal
    let totalVolume: Int
    let percentPriceChange: Decimal
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case symbol = "symbol"
        case name = "name"
        case image = "image"
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case totalVolume = "total_volume"
        case percentPriceChange = "price_change_percentage_24h"
    }

}
