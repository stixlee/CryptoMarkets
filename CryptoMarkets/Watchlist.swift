//
//  Watchlist.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/19/24.
//

import SwiftUI

struct Watchlist: View {
    @ObservedObject var state = appState
    
    var body: some View {
        VStack {
            ZStack {
                Color.primaryBG
                VStack {
                    // Header View
                    Header()
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
    Watchlist()
}
