//
//  MarketCapInfoView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 12/31/23.
//

import SwiftUI

struct MarketCapInfoView: View {
    
    @ObservedObject var marketCapInfoViewModel: MarketCapInfoViewModel
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(
                    marketCapInfoViewModel.marketCap,
                    format: .currency(code: "USD").precision(.fractionLength(0))
                )
                .font(.headline)
                .fontWeight(.bold)
                .foregroundStyle(Color.primaryFG)
                .padding(.bottom, 4)
                MarketCapChangeView(viewModel: marketCapInfoViewModel)
            }
            Spacer()

            Image(systemName: marketCapInfoViewModel.percentChange >= 0.0 ? "arrow.up" : "arrow.down")
                            .foregroundStyle(marketCapInfoViewModel.percentChange >= 0.0 ? Color.green : Color.red)
                            .font(.title)
        }
        .padding(.leading, 24)
        .padding(.trailing, 24)
    }
}

#Preview {
    MarketCapInfoView(marketCapInfoViewModel: MarketCapInfoViewModel())
}
