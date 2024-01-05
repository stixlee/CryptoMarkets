//
//  Array+Extensions.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/4/24.
//

import Foundation

extension Array {
    func first(_ elementCount: Int) -> Array {
          let min = Swift.min(elementCount, count)
          return Array(self[0..<min])
    }
}
