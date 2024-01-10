//
//  CoinMarketLineItemView.swift
//  CryptoMarkets
//
//  Created by John Ayres on 1/5/24.
//

import SwiftUI

struct CoinMarketLineItemView: View {
    @ObservedObject var viewModel: CoinMarketLineItemViewModel
    
    var body: some View {
        HStack(alignment: .center) {
            Text(
                viewModel.rank,
                format: .number
            )
            Label {
                Text(viewModel.symbol.capitalized)
                    .font(.subheadline)
            } icon: {
                // TODO: Replace this with an image downloaded from a URL
                Image(systemName: "bitcoinsign.circle.fill")
                    .font(.subheadline)
                    .foregroundStyle(.orange)
            }
            Spacer()
            Text(
                viewModel.price,
                format: .currency(code: "USD").precision(.fractionLength(2))
            )
            .font(.caption)
            .foregroundStyle(Color.primaryFG)
            Spacer()
            Image(
                systemName: viewModel.percentDelta >= 0.0 ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill"
            )
            .font(.caption)
            .foregroundColor(viewModel.percentDelta >= 0.0 ? Color.green : Color.red)
            Text(
                viewModel.percentDelta,
                format: .percent.precision(.fractionLength(2))
            )
            .font(.caption)
            .fontWeight(.semibold)
            .foregroundStyle(viewModel.percentDelta >= 0.0 ? Color.green : Color.red)
        }
    }
}

#Preview {
    CoinMarketLineItemView(viewModel: CoinMarketLineItemViewModel())
}
