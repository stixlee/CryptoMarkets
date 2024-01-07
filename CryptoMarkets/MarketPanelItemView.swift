//
//  MarketPanelItemView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/7/24.
//

import SwiftUI

struct MarketPanelItemView: View {
    
    @ObservedObject var viewModel: MarketPanelItemViewModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            TitleSectionView(viewModel: viewModel.titleSectionViewModel)
            Spacer()
            ValueSectionView(viewModel: viewModel.valueSectionViewModel)
        }
        .padding(.leading, 24)
    }
}

#Preview {
    MarketPanelItemView(
        viewModel: MarketPanelItemViewModel(
            title: "Market Cap",
            secondaryTitle: "Global Market Capitalization",
            value: 1655999069111, percentChange: 0.0234
        )
    )
}
