//
//  TitleSectionView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/11/24.
//

import SwiftUI

struct TitleSectionView: View {
    
    @ObservedObject var viewModel: PanelItemViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            TitleView(viewModel: viewModel)
            SubtitleView(viewModel: viewModel)
        }
    }
}

#Preview {
    TitleSectionView(viewModel: PanelItemViewModel())
}
