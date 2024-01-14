//
//  Api+CoinMarketCap+GlobalMetrics.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/3/24.
//

import Foundation

extension Api {
    
    func globalMarkets() async throws -> QuoteResponse {
        let urlString = "https://pro-api.coinmarketcap.com/v1/global-metrics/quotes/latest"
        guard let  url = URL(string: urlString) else {
            print("DEBUG: invalid URL")
            throw NetworkingError.invalidUrl
        }
        let request = buildCMCRequest(url: url, apiKey: "acee5f7b-6669-4844-851b-6f364492daf7")

        let (data, response) = try await URLSession.shared.data(for: request)
                
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkingError.invalidResponse(response: response)
        }
        
        guard httpResponse.statusCode == 200 else {
            throw NetworkingError.responseError(response: httpResponse)
        }

        do {
            let quoteResponse = try JSONDecoder().decode(QuoteResponse .self, from: data)
            return quoteResponse
        } catch let error {
            if let decodingError = error as? DecodingError {
                throw NetworkingError.invalidJSON(decodingError: decodingError)
            }
            throw NetworkingError.unknown(error: error)
        }
        
    }
    
}

private extension Api {
    
    func buildCMCRequest(url: URL, apiKey: String) -> URLRequest {
        var request = URLRequest(url: url)
        request.addValue("acee5f7b-6669-4844-851b-6f364492daf7",
                         forHTTPHeaderField: "X-CMC_PRO_API_KEY")
        return request
    }
}

