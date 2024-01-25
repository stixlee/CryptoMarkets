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

}

private extension CoinMarketApi {
    
    func buildCMCRequest(url: URL, apiKey: String) -> URLRequest {
        var request = URLRequest(url: url)
        request.addValue("acee5f7b-6669-4844-851b-6f364492daf7",
                         forHTTPHeaderField: "X-CMC_PRO_API_KEY")
        return request
    }
}

