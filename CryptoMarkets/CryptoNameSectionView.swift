//
//  CryptoNameSectionView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/7/24.
//

import SwiftUI

struct CryptoNameSectionView: View {
    
    @ObservedObject var viewModel: CryptoNameSectionViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            CryptoNameRowView(viewModel: viewModel.nameRowViewModel)
            CryptoSymbolRowView(viewModel: viewModel.symbolRowViewModel)
        }
    }
}

#Preview {
    CryptoNameSectionView(viewModel: CryptoNameSectionViewModel())
}
