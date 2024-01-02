//
//  Api.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/1/24.
//

import Foundation

let api = Api.shared
final class Api {
    
    static fileprivate let shared = Api()
    
    private init() { }
    
}

enum NetworkingError: Error {
    case invalidUrl
    case invalidRequest
    case invalidResponse
    case invalidJSON
}

