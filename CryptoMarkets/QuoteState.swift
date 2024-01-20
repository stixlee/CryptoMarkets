//
//  File.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/19/24.
//

import SwiftUI

final class QuoteState: ObservableObject {
    
    let marketCap: Decimal
    let marketCapPercentChange: Decimal
    let volume: Decimal
    let volumePercentChange: Decimal
    
    var isLoaded: Bool = false
    
    init(from quote: Quote) {
        self.marketCap = quote.data.quote.USD.totalMarketCap.decimalValue ?? 0.0
        self.marketCapPercentChange = (quote.data.quote.USD.marketCapChange.decimalValue ?? 0.0) / 100.0
        self.volume = quote.data.quote.USD.totalVolume.decimalValue ?? 0.0
        self.volumePercentChange = (quote.data.quote.USD.volumeChange.decimalValue ?? 0.0) / 100.0
    }

    init() {
        self.marketCap = 1234000000000
        self.marketCapPercentChange = 0.0023
        self.volume = 52345000000
        self.volumePercentChange = 0.0243
    }
}
