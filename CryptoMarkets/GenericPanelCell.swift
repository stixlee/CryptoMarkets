//
//  MarketPanelCell.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/20/24.
//

import SwiftUI

struct GenericPanelCell: View {
    
    @ObservedObject var state: GenericPanelState
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            GenericTitleSection(state: state)
            Spacer()
            GenericValueSection(state: state)
        }
        .padding(.leading, 24)
    }
}

//#Preview {
//    GenericPanelCell(state: GenericPanelState(
//        type: .marketCap, from: MarketState())
//    )
//}
