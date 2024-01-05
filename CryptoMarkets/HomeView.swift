//
//  HomeView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 12/30/23.
//

import SwiftUI

struct HomeView: View {
    
    let sideMenuWidth = 100.0
    
    @State var showSideView: Bool = true
    
    var body: some View {
        ZStack {
            TabView {
                MarketWatchView(showSideMenu: $showSideView)
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
            VStack(alignment: .trailing) {
                Spacer()
                HStack(alignment: .center) {
                    Spacer()
                    RightSideMenuView()
                        .offset(x: showSideView ? 0 : UIScreen.screenWidth)
                }
                Spacer()
            }
        }

    }
}

//#Preview {
//    HomeView()
//}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
