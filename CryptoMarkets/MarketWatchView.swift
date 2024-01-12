//
//  DashboardView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 12/30/23.
//

import SwiftUI

struct MarketWatchView: View {
    
    @StateObject var viewModel: MarketwatchCompositeViewModel = MarketwatchCompositeViewModel()
//    @Binding var showSideMenu: Bool
    
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
                    
                    VStack {
                        ScrollView(.vertical, showsIndicators: false) {
                            // Market Snapshot
                            PanelView(panelViewModel: viewModel.marketSnapshotViewModel)
                                .padding([.leading, .trailing], 18)
                                .padding(.bottom, 24)
                            
                            PanelView(panelViewModel: viewModel.largeCapMoversViewModel)
                                .padding([.leading, .trailing], 18)
                                .padding(.bottom, 24)
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
                    viewModel.marketSnapshotViewModel = PanelViewModel(from: snapshot)
                    viewModel.largeCapMoversViewModel = PanelViewModel(with: topMovers)
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
