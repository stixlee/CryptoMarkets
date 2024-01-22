//
//  Api.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/1/24.
//

import Foundation

let api = Api.shared
final class Api {
    
    static fileprivate let shared = Api()
    
    private var coinMarketApi = CoinMarketApi()
    
    private init() { }
    
    func latestQuote() async throws -> Quote {
        return try await coinMarketApi.latestQuote()
    }
    
    func largeCapMovers() async throws -> [CryptoSummary] {
        return try await coinMarketApi.largeCapMovers()
    }
    
    func buildQueryString(parameters: [String: String]) -> String {
        let parms = [String] (parameters.keys)
        var queryString: String = "?"
        
        for index in 0..<parms.count-1 {
            let name = parms[index]
            if let value = parameters[name] {
                queryString.append(name+"="+value+"&")
            }
        }
        if let name = parms.last, let value = parameters[name] {
            queryString.append(name+"="+value)
        }
        
        return queryString
    }
    
}
