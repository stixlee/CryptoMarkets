//
//  Crypto Markets.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 12/30/23.
//

import SwiftUI

struct CryptoMarketsView: View {
    
    @StateObject var viewModel: CryptoMarketsViewModel = CryptoMarketsViewModel()
    
    var body: some View {
        VStack {
            ZStack {
                Color.primaryBackground
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
                            ForEach(viewModel.viewModels) { viewModel in
                                CryptoCellView(viewModel: viewModel)
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
        .refreshable {
            await viewModel.loadData()
        }
        .task {
            await viewModel.loadData()
        }

    }
    
//    private func loadData() async -> Void {
//        let crypto = await marketDataService.coinsMarkets()
//        DispatchQueue.main.async {
//            withAnimation(.smooth) {
//                viewModel.updateItems(with: crypto)
//            }
//        }
//    }
}

// coin, price in usd, 24 hour delta, market cap

#Preview {
    CryptoMarketsView()
}
