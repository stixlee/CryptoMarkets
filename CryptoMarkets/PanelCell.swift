//
//  PanelCell.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/27/24.
//

import SwiftUI

struct PanelCell: View {
    
    @State var state: any CellBackingState
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            CellTitleSection(state: state)
            Spacer()
            CellValueSection(state: state)
        }
        .padding(.leading, 24)
    }
}

#Preview {
    PanelCell(state: MarketCapState(state: QuoteState()))
}
