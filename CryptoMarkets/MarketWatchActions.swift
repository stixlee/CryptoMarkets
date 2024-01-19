//
//  MarketWatchActions.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/19/24.
//

import SwiftUI

final class MarketWatchActions {
    
    @ObservedObject var state = appState
    
    func loadData() async -> Void {
        if state.latestQuote.isLoaded { return }
        do {
//            let topMovers = try await marketDataService.movers()
            let latestQuote = try await api.latestQuote()
            print("DEBUG: Data Loaded Successfully")
            await updateQuote(quote: latestQuote)
        } catch (let error) {
            if let error = error as? NetworkingError {
                print("DEBUG: Networking Error - \(error.localizedDescription)")
            }
        }
    }
    
    func refreshData() async -> Void {
        do {
//            let topMovers = try await marketDataService.movers()
            let quote = try await api.latestQuote()
            print("DEBUG: Data Loaded Successfully")
            await updateQuote(quote: quote)
        } catch (let error) {
            if let error = error as? NetworkingError {
                print("DEBUG: Networking Error - \(error.localizedDescription)")
            }
        }

    }
    
    @MainActor private func updateQuote(quote: Quote) async {
        withAnimation(.easeInOut) {
            appState.latestQuote = QuoteState(from: quote)
//            largeCapMoversViewModel = PanelViewModel(with: movers)
            state.latestQuote.isLoaded = true
        }

    }

}
