//
//  TitleSectionView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/7/24.
//

import SwiftUI

struct TitleSectionView: View {
    
    @ObservedObject var viewModel: MarketPanelItemViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            TitleRowView(viewModel: viewModel)
            Text(viewModel.secondaryTitle)
                .font(.caption)
                .foregroundStyle(Color.gray)
                .lineLimit(1)
        }
    }
}

#Preview {
    TitleSectionView(
        viewModel: MarketPanelItemViewModel(
            title: "Market Cap",
            secondaryTitle: "Global Market Capitalization",
            value: 0.0,
            percentChange: 0.2345))
}
