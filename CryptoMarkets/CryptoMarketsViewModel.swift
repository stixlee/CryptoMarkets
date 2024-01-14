//
//  CryptoMarketsViewModel.swift
//  CryptoMarkets
//
//  Created by John Ayres on 1/5/24.
//

import SwiftUI

final class CryptoMarketsViewModel: ObservableObject {
    
    @Published var viewModels: [CryptoCellViewModel]
    
    var isLoaded = false
    
    init() {
        self.viewModels =  []
    }
    
    func updateItems(with coinsMarkets: [MarketItem]) {
        
        var loadedItems: [CryptoCellViewModel] = []
        
        for marketItem in coinsMarkets {
            loadedItems.append(CryptoCellViewModel(from: marketItem))
        }
        
        self.viewModels = loadedItems
        
        
    }
    
    func loadData() async -> Void {
        if isLoaded { return }
        do {
            let crypto = try await marketDataService.coinsMarkets()
            if crypto.isEmpty {
                print("DEBUG: Crypto Data Load was Empty")
                return
            }
            print("DEBUG: Crypto Data Load was successful")
            await updateViewModels(cryptoData: crypto)
        } catch (let error ) {
            if let error = error as? NetworkingError {
                print("DEBUG: Networking Error - \(error.localizedDescription)")
            }
        }
    }
    
    func refreshData() async -> Void {
        do {
            let crypto = try await marketDataService.coinsMarkets()
            if crypto.isEmpty {
                print("DEBUG: Crypto Data Load was Empty")
                return
            }
            print("DEBUG: Crypto Data Load was successful")
            await updateViewModels(cryptoData: crypto)
        } catch (let error ) {
            if let error = error as? NetworkingError {
                print("DEBUG: Networking Error - \(error.localizedDescription)")
            }
        }
    }

    
    @MainActor private func updateViewModels(cryptoData: [MarketItem]) {
        withAnimation(.smooth) { [weak self] in
            self?.updateItems(with: cryptoData)
            self?.isLoaded = true
        }
    }

}
