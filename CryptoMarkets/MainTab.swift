//
//  LaunchView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/19/24.
//

import SwiftUI

struct MainTab: View {
    
    @ObservedObject var state = appState
    @State var selectedTab: Int = Tabs.markets.rawValue
    
    let tabActions = TabActions()
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab.onUpdate {
                tabActions.tabSelected(selectedTab: selectedTab)
            }) {
                MarketWatch()
                    .tabItem {
                        Label("Market", systemImage: "house.fill")
                    }
                    .tag(Tabs.markets.rawValue)
                CryptoCurrencies()
                    .tabItem {
                        Label("Crypto", systemImage: "bitcoinsign.circle.fill")
                    }
                    .tag(Tabs.crypto.rawValue)
                Watchlist()
                    .tabItem {
                        Label("Watchlist", systemImage: "sunglasses.fill")
                    }
                    .tag(Tabs.watchlist.rawValue)
                Intelligence()
                    .tabItem {
                        Label("Abalysis", systemImage: "graduationcap.fill")
                    }
                    .tag(Tabs.intelligence.rawValue)
                Profile()
                    .tabItem {
                        Label("Profile", systemImage: "person.fill")
                    }
                    .tag(Tabs.profile.rawValue)

            }
            .background(Color.primaryBG)
            .accentColor(.orange)
//            .onChange(of: selectedTab) { newValue in
//                model.myFunction(item: newValue)
//            }
        }
    }
}

#Preview {
    MainTab()
        .environmentObject(AppState())
}
