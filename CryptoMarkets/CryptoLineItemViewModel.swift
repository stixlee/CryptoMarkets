//
//  CryptoLineItemViewModel.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 12/31/23.
//

import Foundation

final class CryptoLineItemViewModel: ObservableObject, Equatable, Hashable, Identifiable {
    static func == (lhs: CryptoLineItemViewModel, rhs: CryptoLineItemViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var id: String = UUID().uuidString
    var imageString: String = "bitcoinsign.circle.fill"
    var name: String = "Ethereum"
    var symbol: String = "ETH"
    var price: Decimal = 502.32
    var delta: Decimal = 1.62
}
