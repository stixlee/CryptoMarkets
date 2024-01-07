//
//  TitleSectionView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/7/24.
//

import SwiftUI

struct TitleSectionView: View {
    
    @ObservedObject var viewModel: TitleSectionViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            TitleRowView(viewModel: viewModel.titleRowViewModel)
            Text(viewModel.secondaryTitle)
                .font(.caption)
                .foregroundStyle(Color.gray)
                .lineLimit(1)
        }
    }
}

#Preview {
    TitleSectionView(
        viewModel: TitleSectionViewModel(
            title: "Market Cap",
            secondaryTitle: "Global Market Capitalization",
            percentChange: 0.2345))
}
