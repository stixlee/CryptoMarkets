//
//  MarketCapData.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/1/24.
//

import Foundation

struct MarketCapData: Codable {
    let btc: Double
    let eth: Double
    let ltc: Double
    let bch: Double
    let bnb: Double
    let eos: Double
    let xrp: Double
    let xlm: Double
    let link: Double
    let dot: Double
    let yfi: Double
    let usd: Double
    let aed: Double
    
    var mirror: Mirror {
        return Mirror(reflecting: self)
    }
}
