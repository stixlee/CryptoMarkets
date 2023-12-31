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
                    
                    VStack {
                        ScrollView {
                            // Market Cap View
                            MarketCapInfoView(marketCapInfoViewModel: MarketCapInfoViewModel())
                                .padding([.top, .bottom], 16)
                                .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.primaryFG, lineWidth: 0.5)
                                    )
                                .padding(.top, 24)
                            
                            // Volume View
                            
                            // Volatility Index View
                            
                            // Trending View
                            
                            // Biggest Movers View
         
                        }
                    }
                    .padding([.leading, .trailing], 8)
                   
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
