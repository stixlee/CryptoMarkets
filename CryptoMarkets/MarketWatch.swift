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
                        MarketPanel(title: "")
                            .padding([.leading, .trailing], 18)
                            .padding(.top, 12)
                        MoversPanel(title: "Large Cap Movers")
                            .padding([.leading, .trailing], 18)
                            .padding(.top, 12)
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
