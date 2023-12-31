//
//  CryptoLineItemView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 12/31/23.
//

import SwiftUI

struct CryptoLineItemView: View {
    
    @ObservedObject var viewModel: CryptoLineItemViewModel
    
    var body: some View {
        HStack(alignment: .center) {
            Label {
                Text(viewModel.name+" (\(viewModel.symbol))")
                    .font(.subheadline)
            } icon: {
                Image(systemName: viewModel.imageString)
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
            Image(
                systemName: viewModel.delta >= 0.0 ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill"
            )
                .font(.caption)
                .foregroundColor(viewModel.delta >= 0.0 ? Color.green : Color.red)
            Text(
                viewModel.delta,
                format: .percent.precision(.fractionLength(2))
            )
            .font(.caption)
            .fontWeight(.semibold)
            .foregroundStyle(viewModel.delta >= 0.0 ? Color.green : Color.red)
        }
//        .padding(.leading, 12)
//        .padding(.trailing, 12)
//        .padding(.bottom, 18)

    }
}

#Preview {
    CryptoLineItemView(viewModel: CryptoLineItemViewModel())
}
