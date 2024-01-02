//
//  NetworkingError.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/1/24.
//

import Foundation

enum NetworkingError: Error {
    case invalidUrl
    case invalidRequest
    case invalidResponse
    case invalidJSON
}
