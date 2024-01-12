//
//  Crypto Markets.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 12/30/23.
//

import SwiftUI

struct CryptoMarketsView: View {
    
    @ObservedObject var viewModel: CryptoMarketsViewModel = CryptoMarketsViewModel()
    
    var body: some View {
        VStack {
            ZStack {
                Color.primaryBG
                VStack {
                    // Header View
                    HeaderView(viewModel: HeaderViewModel(
                        tabId: 1,
                        title: "Cryptocurrencies",
                        icon: "bitcoinsign.circle.fill",
                        showSideMenu: false,
                        accentColor: .orange)
                    )
                    
                    // Coin market List View
                    VStack(alignment: .center) {
                        ScrollView(.vertical, showsIndicators: false) {
                            ForEach(viewModel.coinsMarketsItems) { item in
                                CoinMarketLineItemView(viewModel: item)
                                    .padding(.bottom, 12)
                            }
                            Spacer()
                        }
                    }
                    .padding(20)
                    Spacer()
                }
            }
            Spacer()
            Divider()
                .padding(0)
        }
        .edgesIgnoringSafeArea([.leading, .trailing, .top])
        .task {
            let response = await marketDataService.coinsMarkets()
            DispatchQueue.main.async {
                viewModel.updateItems(with: response)
            }
        }

    }
}

// coin, price in usd, 24 hour delta, market cap

#Preview {
    CryptoMarketsView()
}
