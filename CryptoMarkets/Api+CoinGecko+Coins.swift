//
//  Api+CoinGecko+Coins.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/14/24.
//

import Foundation

extension Api {
    
    func fetchCoin(id: String) async throws -> CoinResponse {
        let baseUrl = "https://api.coingecko.com/api/v3/coins/"
        let id = id
        let parameters: [String: String] = [
            "tickers": "true",
            "market_data": "true",
            "community_data": "true",
        ]
        let queryString: String = buildQueryString(parameters: parameters)

        guard let  url = URL(string: baseUrl+id+queryString) else {
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
            let coinInfo = try JSONDecoder().decode(CoinResponse.self, from: data)
            return coinInfo
        } catch let error {
            if let decodingError = error as? DecodingError {
                throw NetworkingError.invalidJSON(decodingError: decodingError)
            }
            throw NetworkingError.unknown(error: error)
        }
    }
}
