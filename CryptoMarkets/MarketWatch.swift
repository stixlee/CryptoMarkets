//
//  CryptoMarkets.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/19/24.
//

import SwiftUI

struct MarketWatch: View {
    
    @ObservedObject var state = appState
    
    let actions = MarketWatchActions()
    
    var body: some View {
        VStack {
            ZStack {
                Color.primaryBG
                VStack {
                    // Header View
                    Header()
                    ScrollView {
                        Panel(title: "", type: .market)
                            .padding([.leading, .trailing], 18)
                            .padding(.top, 12)
                        if appState.largeCap.movers.isEmpty {
                            EmptyView()
                        } else {
                            Panel(title: "Large Cap Movers", type: .largeCapMovers)
                                .padding([.leading, .trailing], 18)
                                .padding(.top, 12)
                        }
                        if appState.largeCap.mostTraded.isEmpty {
                            EmptyView()
                        } else {
                            Panel(title: "Large Cap Most Traded", type: .mostTraded)
                                .padding([.leading, .trailing], 18)
                                .padding(.top, 12)
                        }

                    }
                    Spacer()
                }
            }
            Spacer()
            Divider()
                .padding(0)
        }
        .edgesIgnoringSafeArea([.leading, .trailing, .top])
        .refreshable {
            await actions.refreshData()
        }
        .task {
            await actions.loadData()
            print("")
        }
    }
    
}

#Preview {
    MarketWatch()
}
