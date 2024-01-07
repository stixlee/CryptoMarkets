//
//  TitleViewModel.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/7/24.
//

import Foundation

@Observable final class TitleRowViewModel: ObservableObject {
    let title: String
    var percentChange: Decimal
    
    init(title: String, percentChange: Decimal) {
        self.title = title
        self.percentChange = percentChange
    }
}

extension TitleRowViewModel {
    var isPositive: Bool { return percentChange >= 0.0 }
}

