//
//  DashboardView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 12/30/23.
//

import SwiftUI

struct MarketWatchView: View {
    var body: some View {
        VStack {
            ZStack {
                Color.primaryBG
                VStack {
                    HeaderView(title: "Market Watch", icon: "bitcoinsign.circle.fill")
                    Spacer()
                }
            }
            Spacer()
            Divider()
                .padding(0)
        }
        .edgesIgnoringSafeArea([.leading, .trailing, .top])

        
        // Header View
        
        // Market Cap View
        
        // Volume View
        
        // Trending View
        
        // Biggest Movers View
    }
}

#Preview {
    MarketWatchView()
}
