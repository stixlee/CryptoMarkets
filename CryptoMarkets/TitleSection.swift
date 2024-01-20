//
//  LeadingSection.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/20/24.
//

import SwiftUI

struct TitleSection: View {
    
    @ObservedObject var state: MarketPanelState
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            MarketCellTitle(state: state)
            MarketCellSubtitle(state: state)
        }
    }
}

#Preview {
    TitleSection(state: MarketPanelState())
}
