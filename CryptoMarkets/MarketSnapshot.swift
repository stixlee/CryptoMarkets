//
//  CryptoMarkets.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/19/24.
//

import SwiftUI

struct MarketSnapshot: View {
    
    @ObservedObject var state = appState
    
    var body: some View {
        VStack {
            ZStack {
                Color.primaryBG
                VStack {
                    // Header View
                    HeaderView(viewModel: HeaderViewModel(
                        tabId: 0,
                        title: "Crypto Markets",
                        icon: "dollarsign.circle.fill",
                        showSideMenu: false,
                        accentColor: .green)
                    )
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
    MarketSnapshot()
}
