//
//  MarketPanelCell.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/20/24.
//

import SwiftUI

struct MarketPanelCell: View {
    
    @ObservedObject var state: MarketPanelState
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            TitleSection(state: state)
            Spacer()
            ValueSection(state: state)
        }
        .padding(.leading, 24)
    }
}

#Preview {
    MarketPanelCell(state: MarketPanelState(
        type: .marketCap, from: QuoteState())
    )
}
