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
            let (largeCapMovers, largeCapMostTraded) = try await api.largeCapMovers()
            let latestQuote = try await api.latestQuote()
            print("DEBUG: Data Loaded Successfully")
            var moversArray = [GenericPanelState]()
            for item in largeCapMovers {
                moversArray.append(GenericPanelState(with: item))
            }
            var mostTradedArray = [GenericPanelState]()
            for item in largeCapMostTraded {
                mostTradedArray.append(GenericPanelState(with: item))
            }
            await updateState(quote: latestQuote, movers: moversArray, mostTraded: mostTradedArray)
        } catch (let error) {
            if let error = error as? NetworkingError {
                print("DEBUG: Networking Error - \(error.localizedDescription)")
            }
        }
    }
    
    func refreshData() async -> Void {
        do {
            let (largeCapMovers, largeCapMostTraded) = try await api.largeCapMovers()
            let quote = try await api.latestQuote()
            print("DEBUG: Data Loaded Successfully")
            var moversArray = [GenericPanelState]()
            for item in largeCapMovers {
                moversArray.append(GenericPanelState(with: item))
            }
            var mostTradedArray = [GenericPanelState]()
            for item in largeCapMostTraded {
                mostTradedArray.append(GenericPanelState(with: item))
            }
            await updateState(quote: quote, movers: moversArray, mostTraded: mostTradedArray)
        } catch (let error) {
            if let error = error as? NetworkingError {
                print("DEBUG: Networking Error - \(error.localizedDescription)")
            }
        }

    }
    
    @MainActor private func updateState(quote: Quote, 
                                        movers: [GenericPanelState],
                                        mostTraded: [GenericPanelState]) async {
        withAnimation(.easeInOut) {
            appState.latestQuote = MarketState(from: quote)
            appState.largeCap.movers = movers
            appState.largeCap.mostTraded = mostTraded
            state.latestQuote.isLoaded = true
        }
    }
    
}
