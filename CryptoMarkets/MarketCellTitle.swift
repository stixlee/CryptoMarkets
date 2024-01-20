//
//  CellTitle.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/20/24.
//

import SwiftUI

struct MarketCellTitle: View {
    
    @ObservedObject var state: MarketPanelState
    let actions = MarketCellActions()
        
    var body: some View {
        HStack(alignment: .center, spacing: 2) {
            Image(systemName: state.percentChange >= 0.0 ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(state.percentChange >= 0.0 ? Color.green : Color.red)
            
            Text(state.title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color.primaryForeground)
            
            Button {
                actions.didTapInfoButton(source: state.type)
            } label: {
                Image(systemName: "info.circle")
                    .font(.subheadline)
                    .foregroundColor(.blue)
            }
            .offset(y: -4)

            Spacer()

        }
    }
}

#Preview {
    MarketCellTitle(state: MarketPanelState())
}
