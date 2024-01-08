//
//  CryptoNameRowViewModel.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/7/24.
//

import Foundation

@Observable final class CryptoNameRowViewModel: ObservableObject {
    let name: String
    var percentChange: Decimal
    
    init(name: String, percentChange: Decimal) {
        self.name = name
        self.percentChange = percentChange
    }
    
    init() {
        self.name = "Bitcoin"
        self.percentChange = 0.0234
    }
}

extension CryptoNameRowViewModel {
    var isPositive: Bool { return percentChange >= 0.0 }
}
