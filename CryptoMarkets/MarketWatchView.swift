//
//  DashboardView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 12/30/23.
//

import SwiftUI

struct MarketWatchView: View {
    
    @StateObject var viewModel: MarketwatchCompositeViewModel = MarketwatchCompositeViewModel()
    @Binding var showSideMenu: Bool
    
    var body: some View {
        VStack {
            ZStack {
                Color.primaryBG
                VStack {
                    // Header View
                    HeaderView(title: "Crypto Markets", icon: "arrowtriangle.up.fill", showSideView: $showSideMenu, accentColor: .green)
                    
                    VStack {
                        ScrollView(.vertical, showsIndicators: false) {
                            // Market Snapshot
                            MarketPanelView(viewModel: viewModel.marketPanelViewModel)
                                .padding([.leading, .trailing], 18)
                                .padding(.bottom, 24)
                            
                            CryptoPanelView(viewModel: viewModel.cryptoPanelViewModel)
                                .padding([.leading, .trailing], 18)

//                            Group {
//                                
//                                // Market Snapshot
//                                MarketPanelView(viewModel: viewModel.marketPanelViewModel)
//                                    .padding([.leading, .trailing], 18)
//                                
////                                CryptoPanelView(cryptoViewModel: viewModel.cryptoPanelVIewModel)
//                                                                
//                                // Leading Indicators View
////                                LeadingIndicatorsView(viewModel: viewModel.leadingIndicatorsViewModel)
////                                    .padding([.top, .bottom], 16)
////                                    .overlay(
////                                            RoundedRectangle(cornerRadius: 10)
////                                                .stroke(Color.primaryFG, lineWidth: 0.5)
////                                        )
////                                    .padding(.top, 18)
//
//                                // Top Movers View
////                                CryptoPanelView(cryptoViewModel: viewModel.cryptoPanelViewModel)
//                                
////                                BiggestMoversView(viewModel: viewModel.biggestMoversViewModel)
////                                    .padding([.top, .bottom], 16)
////                                    .padding([.leading, .trailing], 18)
////                                    .overlay(
////                                            RoundedRectangle(cornerRadius: 10)
////                                                .stroke(Color.primaryFG, lineWidth: 0.5)
////                                        )
////                                    .padding(.top, 18)
//
//
//                                // Trending View
////                                TrendingView(viewModel: viewModel.trendingViewModel)
////                                    .padding([.top, .bottom], 16)
////                                    .padding([.leading, .trailing], 18)
////                                    .overlay(
////                                            RoundedRectangle(cornerRadius: 10)
////                                                .stroke(Color.primaryFG, lineWidth: 0.5)
////                                        )
////                                    .padding(.top, 18)
//                                Color.clear
//                                    .frame(height: 12)
//                            }
                        }
                    }
                    .padding([.leading, .trailing], 8)
                    .padding(.top, 18)
                    Spacer()
                }
            }
            Spacer()
            Divider()
                .padding(0)
        }
        .edgesIgnoringSafeArea([.leading, .trailing, .top])
        .refreshable {
            await loadData()
        }
        .task {
            await loadData()
        }

    }
    
    private func loadData() async -> Void {
        do {
            let topMovers = try await marketDataService.movers()
            let snapshot = try await marketDataService.marketWatch()
//            let trendingSnapshots = try await marketDataService.trending()
            DispatchQueue.main.async {
                withAnimation(.easeInOut) {
                    viewModel.marketPanelViewModel = MarketPanelViewModel(from: snapshot, title: "Market Snapshot")
                    viewModel.cryptoPanelViewModel = CryptoPanelViewModel(from: topMovers)
                    print()
                }
            }
        } catch (let error) {
            print(error)
        }
    }

}

//#Preview {
//    MarketWatchView(homeViewModel: HomeViewModel())
//}
