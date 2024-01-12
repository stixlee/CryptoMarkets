//
//  ValueSectionView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/11/24.
//

import SwiftUI

struct ValueSectionView: View {

    @ObservedObject var viewModel: PanelItemViewModel

    var body: some View {
        VStack(alignment: .trailing, spacing: 4) {
            HStack(alignment: .center, spacing: 0) {
                Text(viewModel.displayValue,
                     format: .currency(code: "USD").precision(.fractionLength(2))
                )
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(viewModel.valueModifier.rawValue)
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            HStack(alignment: .center, spacing: 0) {
                Text(viewModel.percentChange >= 0.0 ? "+" : "")
                    .font(.caption)
                    .foregroundStyle(viewModel.percentChange >= 0.0 ? Color.green : Color.red)
                Text(viewModel.percentChange,
                    format: .percent.precision(.fractionLength(2))
                )
                    .font(.caption)
                    .foregroundStyle(viewModel.percentChange >= 0.0 ? Color.green : Color.red)
            }
        }
        .padding(.trailing, 24)    }
}

#Preview {
    ValueSectionView(viewModel: PanelItemViewModel())
}
