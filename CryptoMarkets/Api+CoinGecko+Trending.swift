//
//  Api+CoinGecko+Trending.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/3/24.
//

import Foundation

extension Api {
    
    func trending() async throws -> TrendingResponse {
        let urlString = "https://api.coingecko.com/api/v3/search/trending"
        guard let  url = URL(string: urlString) else {
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
            let trendingResponse = try JSONDecoder().decode(TrendingResponse .self, from: data)
            return trendingResponse
        } catch let error {
            if let decodingError = error as? DecodingError {
                throw NetworkingError.invalidJSON(decodingError: decodingError)
            }
            throw NetworkingError.unknown(error: error)
        }
        
    }
    
}
