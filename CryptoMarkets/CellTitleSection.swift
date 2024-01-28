//
//  CellLeadingSection.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/27/24.
//

import SwiftUI

struct CellTitleSection: View {
    
    let state: CellState
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            CellTitle(title: state.title,
                      percentChange: state.percentChange,
                      showInfo: true,
                      type: state.type
            )
            CellSubtitle(subtitle: state.subtitle, image: state.image)
        }
    }
}

//#Preview {
//    CellTitleSection(state: MarketCapState(state: MarketState()))
//}
