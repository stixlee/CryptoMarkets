//
//  PanelItemView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/11/24.
//

import SwiftUI

struct PanelItemView: View {
    
    @ObservedObject var viewModel: PanelItemViewModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            TitleSectionView(viewModel: viewModel)
            Spacer()
            ValueSectionView(viewModel: viewModel)
        }
        .padding(.leading, 24)
    }
}

#Preview {
    PanelItemView(viewModel: PanelItemViewModel())
}
