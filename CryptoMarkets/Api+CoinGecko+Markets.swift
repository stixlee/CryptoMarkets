//
//  Api+CoinGecko+Markets.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/4/24.
//

import Foundation

enum FetchOrder: String {
    case marketCapAscending = "market_cap_rank"
    case marketCapDescending = "market_cap_desc"
}

extension Api {
    
    func fetchCoins() async throws -> [CoinsMarketsResponse] {

        let baseUrl = "https://api.coingecko.com/api/v3/coins/markets"
        let parameters: [String: String] = [
            "vs_currency": "usd",
            "order": FetchOrder.marketCapAscending.rawValue,
            "per_page": "25",
            "page": "1",
            "sparkline": "false"
        ]
        let queryString: String = buildQueryString(parameters: parameters)

        guard let  url = URL(string: baseUrl+queryString) else {
            print("DEBUG: invalid URL")
            throw NetworkingError.invalidUrl
        }
        let request = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
//        print(String(data: data, encoding: .utf8) ?? "nil")
        
        guard let httpResponse = response as? HTTPURLResponse else {
            print("DEBUG: invalid response (fetchCoins) - \(response)")
            throw NetworkingError.invalidResponse
        }
        
        guard httpResponse.statusCode == 200 else {
            print("DEBUG: status error (fetchCoins) - code: \(httpResponse.statusCode) | response: \(httpResponse)")
            throw NetworkingError.invalidResponse
        }

        do {
            let response = try JSONDecoder().decode([CoinsMarketsResponse].self, from: data)
            return response
        } catch let error {
            print("DEBUG: \(error.localizedDescription)")
            throw NetworkingError.invalidJSON
        }
    }
    
    func fetchLargeCapMovers() async throws -> [MarketItemResponse] {
//        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=USD&order=market_cap_desc&per_page=15&page=1&sparkline=false&price_change_percentage=true&locale=en"
//        guard let  url = URL(string: urlString) else {
//            print("DEBUG: invalid URL")
//            throw NetworkingError.invalidUrl
//        }
//        
        let baseUrl = "https://api.coingecko.com/api/v3/coins/markets"
        let parameters: [String: String] = [
            "vs_currency": "usd",
            "order": FetchOrder.marketCapDescending.rawValue,
            "per_page": "100",
            "page": "1",
            "sparkline": "false",
            "price_change_percentage": "true",
            "locale": "en"
        ]
        let queryString: String = buildQueryString(parameters: parameters)

        guard let  url = URL(string: baseUrl+queryString) else {
            print("DEBUG: invalid URL")
            throw NetworkingError.invalidUrl
        }
        let request = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            print("DEBUG: \(response)")
            throw NetworkingError.invalidResponse
        }
        
//        print("DEBUG: \(String(decoding: data, as: UTF8.self))")
        
        do {
            let movers = try JSONDecoder().decode([MarketItemResponse].self, from: data)
            var largeCap = movers.filter {
                $0.marketCap >= 10000000000
            }
            largeCap.sort {
                abs($0.percentPriceChange) > abs($1.percentPriceChange)
            }
            return largeCap.first(4)
        } catch let error {
            print("DEBUG: \(error.localizedDescription)")
            throw NetworkingError.invalidJSON
        }
        
    }
        
}
