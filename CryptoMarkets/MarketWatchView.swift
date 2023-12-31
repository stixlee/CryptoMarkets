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
                    // Header View
                    HeaderView(title: "Market Watch", icon: "arrowtriangle.up.fill", accentColor: .green)
                    
                    // Market Cap View
                    
                    // Volume View
                    
                    // Trending View
                    
                    // Biggest Movers View
                    
                    Spacer()
                }
            }
            Spacer()
            Divider()
                .padding(0)
        }
        .edgesIgnoringSafeArea([.leading, .trailing, .top])

        
    }
}

#Preview {
    MarketWatchView()
}
