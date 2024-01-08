//
//  CryptoPanelItemView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/7/24.
//

import SwiftUI

struct CryptoPanelItemView: View {

    @ObservedObject var viewModel: CryptoPanelItemViewModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            CryptoNameSectionView(viewModel: viewModel.nameSectionViewModel)
            Spacer()
            ValueSectionView(viewModel: viewModel.valueSectionViewModel)
        }
        .padding(.leading, 24)
    }
}

#Preview {
    CryptoPanelItemView(viewModel: CryptoPanelItemViewModel())
}
