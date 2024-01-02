//
//  MarketCapInfoViewModel.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 12/31/23.
//

import Foundation

@Observable final class MarketCapViewModel: ObservableObject {
    
    var marketCap: Decimal = 0.0
    var percentChange: Decimal = 0.0
    
}
