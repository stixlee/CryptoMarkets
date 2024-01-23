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
            var array = [GenericPanelState]()
            for mover in largeCapMovers {
                array.append(GenericPanelState(with: mover))
            }
            await updateState(quote: latestQuote, movers: array)
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
            var array = [GenericPanelState]()
            for mover in largeCapMovers {
                array.append(GenericPanelState(with: mover))
            }
            await updateState(quote: quote, movers: array)
        } catch (let error) {
            if let error = error as? NetworkingError {
                print("DEBUG: Networking Error - \(error.localizedDescription)")
            }
        }

    }
    
    @MainActor private func updateState(quote: Quote, movers: [GenericPanelState]) async {
        withAnimation(.easeInOut) {
            appState.latestQuote = QuoteState(from: quote)
            appState.largeCapMovers.movers = movers
            state.latestQuote.isLoaded = true
        }

    }
}
