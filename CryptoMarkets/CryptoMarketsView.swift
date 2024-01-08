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
//                    HeaderView(title: "Crypto Markets", icon: "bitcoinsign.circle.fill", homeViewModel: HomeViewModel(), accentColor: .orange)
                    
                    // Coin market List View
                    VStack(alignment: .center) {
                        ForEach(viewModel.coinsMarketsItems) { item in
                            CoinMarketLineItemView(viewModel: item)
                                .padding(.bottom, 12)
                        }
                        Spacer()
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
            do {
                let response = try await marketDataService.coinsMarkets()
                DispatchQueue.main.async {
                    viewModel.updateItems(with: response)
                }
            } catch (let error) {
                print(error)
            }
        }

    }
}

// coin, price in usd, 24 hour delta, market cap

#Preview {
    CryptoMarketsView()
}
