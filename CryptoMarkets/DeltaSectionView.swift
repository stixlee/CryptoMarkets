//
//  CellValueSectionView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/12/24.
//

import SwiftUI

struct DeltaSectionView: View {
    
    @ObservedObject var viewModel: CryptoCellViewModel
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            HStack(alignment: .center, spacing: 0) {
                Spacer()
                Text(viewModel.percentDelta >= 0.0 ? "+" : "")
                Text(viewModel.percentDelta,
                     format: .percent.precision(.fractionLength(2))
                )
                .padding(.trailing, 4)
                Image(systemName: viewModel.percentDelta >= 0.0 ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(viewModel.percentDelta >= 0.0 ? Color.green : Color.red)

            }
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(viewModel.percentDelta >= 0.0 ? .green : .red)
        }
    }
}

#Preview {
    DeltaSectionView(viewModel: CryptoCellViewModel())
}
