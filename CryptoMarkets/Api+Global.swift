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
            print("DEBUG: invalid Response")
            throw NetworkingError.invalidResponse
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        var globalMarketDataResponse: GlobalMarketDataResponse
        do {
            globalMarketDataResponse = try JSONDecoder().decode(GlobalMarketDataResponse.self, from: data)
        } catch let DecodingError.dataCorrupted(context) {
            print(context)
            throw NetworkingError.invalidJSON
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            throw NetworkingError.invalidJSON
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            throw NetworkingError.invalidJSON
        } catch let DecodingError.typeMismatch(type, context)  {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
            throw NetworkingError.invalidJSON
        } catch {
            print("error: ", error)
            throw NetworkingError.invalidJSON
        }
        return globalMarketDataResponse.data
    }
    
}
