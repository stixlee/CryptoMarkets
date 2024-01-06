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
                .padding(.leading, 12)
            HStack(alignment: .center, spacing: 0) {
                Text(
                    viewModel.marketCap,
                    format: .currency(code: "USD").precision(.fractionLength(0))
                )
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color.primaryFG)
                Spacer()
                Text("% change")
                    .font(.caption)
                    .foregroundStyle(Color.primaryFG)
                    .padding(.trailing, 10)
                Image(
                    systemName: viewModel.percentChange >= 0.0 ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill"
                )
                    .font(.caption)
                    .foregroundColor(viewModel.percentChange >= 0.0 ? Color.green : Color.red)
                FixedDecimalView(value: viewModel.percentChange)
                    .padding(.leading, -10)

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
