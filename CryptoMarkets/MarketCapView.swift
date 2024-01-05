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
        VStack(alignment: .leading, spacing: 4) {
            Text("Global Market Cap")
                .font(.headline)
                .fontWeight(.semibold)
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
            .padding(16)
            .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.primaryFG, lineWidth: 0.5)
                )
            Spacer()
        }
    }
}

#Preview {
    MarketCapView(viewModel: MarketCapViewModel())
}
