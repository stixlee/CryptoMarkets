//
//  WatchlistVIew.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 12/30/23.
//

import SwiftUI

struct WatchlistView: View {
    var body: some View {
        VStack {
            ZStack {
                Color.primaryBG
                VStack {
                    // Header View
                    HeaderView(title: "Watchlist", icon: "sunglasses.fill", accentColor: .blue)
                    
                    // Crypto List View
                    VStack(alignment: .center) {
                        Spacer()
                        HStack(alignment: .center) {
                            Spacer()
                            Text("Coming Soon")
                                .font(.title)
                                .foregroundStyle(Color.primaryFG)
                            Spacer()
                        }
                        Spacer()
                    }
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
    WatchlistView()
}
