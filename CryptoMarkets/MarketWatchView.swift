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
            await viewModel.refreshData()
        }
        .task {
            await viewModel.loadData()
            print("")
        }

    }
}

#Preview {
    MarketWatchView(viewModel: MarketwatchCompositeViewModel())
}

