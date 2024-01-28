//
//  CellTitle.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/27/24.
//

import SwiftUI

struct CellTitle: View {
    
    let title: String
    let percentChange: Decimal
    let showInfo: Bool
    let actions = MarketCellActions()
    let type: CellType
    
    var body: some View {
        HStack(alignment: .center, spacing: 2) {
            Image(systemName: percentChange >= 0.0 ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(arrowColor)
            
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color.primaryForeground)
            
            if showInfo {
                Button {
                    actions.didTapInfoButton(source: type)
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
        switch percentChange {
        case let x where x > 0.0: return .green
        case let x where x < 0.0: return .red
        default: return .clear
        }
    }
}

//#Preview {
//    CellTitle(title: "Market Cap",
//              percentChange: 0.00234,
//              showInfo: true)
//}
