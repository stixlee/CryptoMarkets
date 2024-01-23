//
//  CellTitle.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/20/24.
//

import SwiftUI

struct GenericCellTitle: View {
    
    @ObservedObject var state: GenericPanelState
    let actions = MarketCellActions()
        
    var body: some View {
        HStack(alignment: .center, spacing: 2) {
            Image(systemName: state.percentChange >= 0.0 ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(arrowColor)
            
            Text(state.title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color.primaryForeground)
            
            if state.showInfo {
                Button {
                    actions.didTapInfoButton(source: state.type)
                } label: {
                    Image(systemName: "info.circle")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }
                .offset(y: -4)
            }
            Spacer()

        }
    }
    
    var arrowColor: Color {
        switch state.percentChange {
        case let x where x > 0.0: return .green
        case let x where x < 0.0: return .red
        default: return .clear
        }
    }
}

#Preview {
    GenericCellTitle(state: GenericPanelState())
}
