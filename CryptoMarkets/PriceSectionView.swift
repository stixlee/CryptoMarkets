//
//  PriceSectionView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/12/24.
//

import SwiftUI

struct PriceSectionView: View {
    
    @ObservedObject var viewModel: CryptoCellViewModel

    var body: some View {
        Text(viewModel.price,
             format: .currency(code: "USD").precision(.fractionLength(2))
        )
        .font(.subheadline)
        .fontWeight(.semibold)
    }
}

#Preview {
    PriceSectionView(viewModel: CryptoCellViewModel())
}
