//
//  CryptoDetailsViewModel.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/16/24.
//

import SwiftUI

@Observable final class CryptoDetailsViewModel: ObservableObject {
    
    var id: String
    var image: String
    var price: Decimal
    var percentChange: Decimal?
    var info: String
    
    init() {
        self.id = ""
        self.image = ""
        self.price = 0.0
        self.percentChange = 0.0
        self.info = ""
    }
    
    private func updateViewModel(from response: CoinResponse) {
        self.image = response.images.large
        self.price = response.marketData.price.usd.decimalValue ?? 0.0
        self.percentChange = response.marketData.percentChange24h.decimalValue ?? 0.0
    }
    
    func loadData(id: String) async {
        guard let response = try? await api.fetchCoin(id: id) else {
            return
        }
        await self.update(from: response)
    }
    
    @MainActor
    private func update(from response: CoinResponse) {
        withAnimation(.easeInOut) {
            updateViewModel(from: response)
        }

    }
    
}


