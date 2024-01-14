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
            print("DEBUG: \(NetworkingError.invalidUrl.localizedDescription)")
            throw NetworkingError.invalidUrl
        }
        let request = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
//        print(String(data: data, encoding: .utf8) ?? "nil")
        
        guard let httpResponse = response as? HTTPURLResponse else {
            print("DEBUG: \(NetworkingError.invalidResponse(response: response).localizedDescription)")
            throw NetworkingError.invalidResponse(response: response)
        }
        
        guard httpResponse.statusCode == 200 else {
            print("DEBUG: \(NetworkingError.responseError(response: httpResponse).localizedDescription)")
            throw NetworkingError.responseError(response: httpResponse)
        }

        do {
            let response = try JSONDecoder().decode([CoinsMarketsResponse].self, from: data)
            return response
        } catch let error {
            if let decodingError = error as? DecodingError {
                print("DEBUG: \(NetworkingError.invalidJSON(decodingError: decodingError).localizedDescription)")
                throw NetworkingError.invalidJSON(decodingError: decodingError)
            }
            throw NetworkingError.unknown(error: error)
        }
    }
    
    func fetchLargeCapMovers() async throws -> [MarketItemResponse] {
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
            throw NetworkingError.invalidUrl
        }
        let request = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkingError.invalidResponse(response: response)
        }
        
        guard httpResponse.statusCode == 200 else {
            throw NetworkingError.responseError(response: httpResponse)
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
            if let decodingError = error as? DecodingError {
                throw NetworkingError.invalidJSON(decodingError: decodingError)
            }
            throw NetworkingError.unknown(error: error)
        }
        
    }
        
}
