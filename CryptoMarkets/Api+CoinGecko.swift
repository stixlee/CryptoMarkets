//
//  Api+CoinGecko.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/2/24.
//

import Foundation

extension Api {
    func coinsMarkets() async throws -> [CoinsMarketsResponse] {
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_rank&per_page=100&page=1&sparkline=false"
        guard let  url = URL(string: urlString) else {
            print("DEBUG: invalid URL")
            throw NetworkingError.invalidUrl
        }
        let request = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        print(String(data: data, encoding: .utf8) ?? "nil")
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
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
}
