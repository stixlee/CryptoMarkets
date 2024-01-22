//
//  CoinMarketApi.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/19/24.
//

import Foundation

final class CoinMarketApi { 
    
    func latestQuote() async throws -> Quote {
        let urlString = "https://pro-api.coinmarketcap.com/v1/global-metrics/quotes/latest"
        guard let  url = URL(string: urlString) else {
            print("DEBUG: \(NetworkingError.invalidUrl.localizedDescription)")
            throw NetworkingError.invalidUrl
        }
        let request = buildCMCRequest(url: url, apiKey: "acee5f7b-6669-4844-851b-6f364492daf7")

        let (data, response) = try await URLSession.shared.data(for: request)
                
        guard let httpResponse = response as? HTTPURLResponse else {
            print("DEBUG: \(NetworkingError.invalidResponse(response: response).localizedDescription)")
            throw NetworkingError.invalidResponse(response: response)
        }
        
        guard httpResponse.statusCode == 200 else {
            print("DEBUG: \(NetworkingError.responseError(response: httpResponse).localizedDescription)")
            throw NetworkingError.responseError(response: httpResponse)
        }

        do {
            let quoteResponse = try JSONDecoder().decode(Quote.self, from: data)
            return quoteResponse
        } catch let error {
            if let decodingError = error as? DecodingError {
                print("DEBUG: \(NetworkingError.invalidJSON(decodingError: decodingError).localizedDescription)")
                throw NetworkingError.invalidJSON(decodingError: decodingError)
            }
            print("DEBUG: \(NetworkingError.unknown(error: error).localizedDescription)")
            throw NetworkingError.unknown(error: error)
        }
        
    }
    
    func largeCapMovers() async throws -> [CryptoSummary] {
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

private extension CoinMarketApi {
    
    func buildCMCRequest(url: URL, apiKey: String) -> URLRequest {
        var request = URLRequest(url: url)
        request.addValue("acee5f7b-6669-4844-851b-6f364492daf7",
                         forHTTPHeaderField: "X-CMC_PRO_API_KEY")
        return request
    }
}

