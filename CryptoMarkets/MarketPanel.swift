//
//  MarketPanel.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/20/24.
//

import SwiftUI

struct MarketPanel: View {
    
    @ObservedObject var state: QuoteState = appState.latestQuote
    
    let title: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .padding(.leading, 24)
                .font(.subheadline)
            ZStack {
                VStack(alignment: .leading, spacing: 18) {
                    GenericPanelCell(state: GenericPanelState(type: .marketCap, from: state))
                    Divider()
                        .frame(minHeight: 1)
                        .background(Color.gray)
                        .padding(.leading, 24)
                    GenericPanelCell(state: GenericPanelState(type: .volume, from: state))
                }
            }
            .padding([.top, .bottom], 18)
            .background(Color.panelBackground)
            .cornerRadius(15)
        }
    }
}

//#Preview {
//    GenericPanel(title: "")
//}
