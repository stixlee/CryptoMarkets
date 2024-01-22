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
            let largeCapMovers = try await api.largeCapMovers()
            let latestQuote = try await api.latestQuote()
            print("DEBUG: Data Loaded Successfully")
            await updateState(quote: latestQuote, movers: largeCapMovers)
        } catch (let error) {
            if let error = error as? NetworkingError {
                print("DEBUG: Networking Error - \(error.localizedDescription)")
            }
        }
    }
    
    func refreshData() async -> Void {
        do {
            let largeCapMovers = try await api.largeCapMovers()
            let quote = try await api.latestQuote()
            print("DEBUG: Data Loaded Successfully")
            await updateState(quote: quote, movers: largeCapMovers)
        } catch (let error) {
            if let error = error as? NetworkingError {
                print("DEBUG: Networking Error - \(error.localizedDescription)")
            }
        }

    }
    
    @MainActor private func updateState(quote: Quote, movers: [CryptoSummary]) async {
        withAnimation(.easeInOut) {
            appState.latestQuote = QuoteState(from: quote)
            appState.largeCapMovers.movers = movers
            state.latestQuote.isLoaded = true
        }

    }

}
