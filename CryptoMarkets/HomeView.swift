//
//  HomeView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 12/30/23.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        TabView {
            MarketWatchView()
                .tabItem {
                    Label("Current", systemImage: "house.fill")
                }
            CryptoMarketsView()
                .tabItem {
                    Label("Markets", systemImage: "bitcoinsign.circle.fill")
                }
            WatchlistView()
                .tabItem {
                    Label("Watchlist", systemImage: "sunglasses.fill")
                }
            AnalysisView()
                .tabItem {
                    Label("Abalysis", systemImage: "graduationcap.fill")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
        .background(Color.primaryBG)
        .accentColor(.orange)
    }
}

#Preview {
    HomeView()
}
