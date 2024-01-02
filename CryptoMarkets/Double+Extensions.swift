//
//  Double+Extensions.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/1/24.
//

import Foundation

extension Double {
    var decimalValue: Decimal? {
        let string = "\(self)"
        return Decimal(string: string)
    }
}
