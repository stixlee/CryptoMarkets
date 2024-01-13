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
            print("DEBUG: invalid URL")
            throw NetworkingError.invalidUrl
        }
        let request = URLRequest(url: url)

        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            print("DEBUG: invalid response (trending) - \(response)")
            throw NetworkingError.invalidResponse
        }
        
        guard httpResponse.statusCode == 200 else {
            print("DEBUG: status error (trending) - code: \(httpResponse.statusCode) | response: \(httpResponse)")
            throw NetworkingError.invalidResponse
        }

//        print("DEBUG: \(String(decoding: data, as: UTF8.self))")
        
        do {
            let trendingResponse = try JSONDecoder().decode(TrendingResponse .self, from: data)
            return trendingResponse
        } catch let error {
            print("DEBUG: \(error.localizedDescription)")
            throw NetworkingError.invalidJSON
        }
        
    }
    
}
