//
//  CoinGeckoApi.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/25/24.
//

import Foundation

final class CoinGeckoApi {
    
    func largeCap() async throws -> ([CryptoSummary], [CryptoSummary]) {
        let baseUrl = "https://api.coingecko.com/api/v3/coins/markets"
        let parameters: [String: String] = [
            "vs_currency": "usd",
            "order": FetchOrder.marketCapDescending.rawValue,
            "page": "1",
            "per_page": "100",
            "sparkline": "false",
            "price_change_percentage": "true",
            "locale": "en"
        ]
        let queryString: String = api.buildQueryString(parameters: parameters)

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
        
        do {
            let movers = try JSONDecoder().decode([CryptoSummary].self, from: data)
            var largeCapMovers = movers.filter {
                $0.marketCap >= 10000000000
            }
            var largeCapMostTraded = largeCapMovers
            largeCapMovers.sort {
                abs($0.percentPriceChange) > abs($1.percentPriceChange)
            }
            largeCapMostTraded.sort {
                $0.totalVolume > $1.totalVolume
            }
            return (largeCapMovers, largeCapMostTraded)
        } catch let error {
            if let decodingError = error as? DecodingError {
                throw NetworkingError.invalidJSON(decodingError: decodingError)
            }
            throw NetworkingError.unknown(error: error)
        }
        
    }

}

