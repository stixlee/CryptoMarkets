//
//  SubtitleView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/11/24.
//

import SwiftUI

struct SubtitleView: View {
    
    @ObservedObject var viewModel: PanelItemViewModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 2) {
            if !viewModel.image.isEmpty {
                EmptyView()
            }
            Text(viewModel.subtitle)
                .font(.caption)
                .foregroundStyle(Color.gray)
                .lineLimit(1)
        }
    }
}

#Preview {
    SubtitleView(viewModel: PanelItemViewModel())
}
