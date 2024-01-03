//
//  DashboardView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 12/30/23.
//

import SwiftUI

struct MarketWatchView: View {
    
    @StateObject var viewModel: MarketwatchCompositeViewModel = MarketwatchCompositeViewModel()
    
    var body: some View {
        VStack {
            ZStack {
                Color.primaryBG
                VStack {
                    // Header View
                    HeaderView(title: "Current Market", icon: "arrowtriangle.up.fill", accentColor: .green)
                    
                    VStack {
                        ScrollView(.vertical, showsIndicators: false) {
                            // Market Cap View
                            MarketCapView(viewModel: viewModel.marketCapViewModel)
                                .padding([.top, .bottom], 16)
                                .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.primaryFG, lineWidth: 0.5)
                                    )
                                .padding(.top, 18)
                            
                            // Volume View
                            TradingVolumeView(viewModel: viewModel.marketVolumeViewModel)
                                .padding([.top, .bottom], 16)
                                .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.primaryFG, lineWidth: 0.5)
                                    )
                                .padding(.top, 18)

                            
                            // Leading Indicators View
                            LeadingIndicatorsView(viewModel: viewModel.leadingIndicatorsViewModel)
                                .padding([.top, .bottom], 16)
                                .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.primaryFG, lineWidth: 0.5)
                                    )
                                .padding(.top, 18)

                            
                            // Trending View
                            TrendingView(viewModel: viewModel.trendingViewModel)
                                .padding([.top, .bottom], 16)
                                .padding([.leading, .trailing], 18)
                                .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.primaryFG, lineWidth: 0.5)
                                    )
                                .padding(.top, 18)

                            
                            // Biggest Movers View
                            BiggestMoversView(viewModel: viewModel.biggestMoversViewModel)
                                .padding([.top, .bottom], 16)
                                .padding([.leading, .trailing], 18)
                                .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.primaryFG, lineWidth: 0.5)
                                    )
                                .padding(.top, 18)

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
        .task {
            do {
                let snapshot = try await marketDataService.marketWatch()
                let trendingSnapshots = try await marketDataService.trending()
                DispatchQueue.main.async {
                    viewModel.marketCapViewModel.marketCap = snapshot.marketCap
                    viewModel.marketCapViewModel.percentChange = snapshot.marketCapPercentChange
                    viewModel.marketVolumeViewModel.tradingVolume = snapshot.volume
                    viewModel.marketVolumeViewModel.volumeChange = snapshot.volumePercentChange
                }
            } catch (let error) {
                print(error)
            }
        }

    }
}

#Preview {
    MarketWatchView()
}
