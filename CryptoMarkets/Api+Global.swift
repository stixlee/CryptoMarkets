//
//  Api+Global.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/1/24.
//

import Foundation


extension Api {
    
    func globalMarketData() async throws -> GlobalMarketData {
        let urlString = "https://api.coingecko.com/api/v3/global"
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

        var globalMarketDataResponse: GlobalMarketDataResponse
        do {
            globalMarketDataResponse = try JSONDecoder().decode(GlobalMarketDataResponse.self, from: data)
        } catch let error {
            print("DEBUG: \(error.localizedDescription)")
            throw NetworkingError.invalidJSON
        }
        return globalMarketDataResponse.data
    }
    
}
