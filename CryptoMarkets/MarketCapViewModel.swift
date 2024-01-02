//
//  MarketCapInfoViewModel.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 12/31/23.
//

import Foundation

final class MarketCapViewModel: ObservableObject {
    
    @Published var marketCap: Decimal = 1756943888889.0
    @Published var percentChange: Decimal = 0.052
    
}
