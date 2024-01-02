//
//  MarketCapInfoView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 12/31/23.
//

import SwiftUI

struct MarketCapView: View {
    
    @ObservedObject var viewModel: MarketCapViewModel
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(
                    viewModel.marketCap,
                    format: .currency(code: "USD").precision(.fractionLength(0))
                )
                .font(.headline)
                .fontWeight(.bold)
                .foregroundStyle(Color.primaryFG)
                .padding(.bottom, 4)
                MarketCapChangeView(viewModel: viewModel)
            }
            Spacer()

            Image(systemName: viewModel.percentChange >= 0.0 ? "arrow.up" : "arrow.down")
                            .foregroundStyle(viewModel.percentChange >= 0.0 ? Color.green : Color.red)
                            .font(.title)
        }
        .padding(.leading, 24)
        .padding(.trailing, 24)

    }
}

#Preview {
    MarketCapView(viewModel: MarketCapViewModel())
}
