//
//  CryptoDetailsView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/16/24.
//

import SwiftUI

struct CoinDetailsView: View {
    
    let id: String
    @StateObject var viewModel = CryptoDetailsViewModel()
    @Binding var showDetails: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(viewModel.price,
                 format: .currency(code: "USD").precision(.fractionLength(2))
            )
        }
        .ignoresSafeArea()
        .task {
            await viewModel.loadData(id: id)
        }

    }

}

//#Preview {
//    CryptoDetailsView(viewModel: CryptoDetailsViewModel(id: "bitcoin"), showDetails: .constant(false))
//}
