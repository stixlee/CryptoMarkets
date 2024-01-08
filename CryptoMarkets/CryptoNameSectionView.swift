//
//  CryptoNameSectionView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/7/24.
//

import SwiftUI

struct CryptoNameSectionView: View {
    
    @ObservedObject var viewModel: CryptoPanelItemViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            CryptoNameRowView(viewModel: viewModel)
            CryptoSymbolRowView(viewModel: viewModel)
        }
    }
}

#Preview {
    CryptoNameSectionView(viewModel: CryptoPanelItemViewModel(
        name: "Bitcoin",
        symbol: "BTC",
        imageUrlString: "",
        value: 43023.23,
        percentChange: 0.0123)
    )
}
