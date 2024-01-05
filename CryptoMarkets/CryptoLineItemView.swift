//
//  CryptoLineItemView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 12/31/23.
//

import SwiftUI

struct CryptoLineItemView: View {
    
    @State var viewModel: MarketItem
    
    var body: some View {
        HStack(alignment: .center) {
            Label {
                Text(viewModel.name+" (\(viewModel.symbol))")
                    .font(.subheadline)
            } icon: {
                AsyncImage(
                    url: URL(string: viewModel.image),
                    content: { image in
                        image.resizable()
                             .aspectRatio(contentMode: .fit)
                             .frame(maxWidth: 12, maxHeight: 12)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
            }
            Spacer()
            Text(
                viewModel.price,
                format: .currency(code: "USD").precision(.fractionLength(2))
            )
                .font(.caption)
                .foregroundStyle(Color.primaryFG)
            Image(
                systemName: viewModel.percentChange >= 0.0 ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill"
            )
                .font(.caption)
                .foregroundColor(viewModel.percentChange >= 0.0 ? Color.green : Color.red)
            Text(
                viewModel.percentChange,
                format: .percent.precision(.fractionLength(2))
            )
            .font(.caption)
            .fontWeight(.semibold)
            .foregroundStyle(viewModel.percentChange >= 0.0 ? Color.green : Color.red)
        }
//        .padding(.leading, 12)
//        .padding(.trailing, 12)
//        .padding(.bottom, 18)

    }
}

//#Preview {
//    CryptoLineItemView(viewModel: CryptoLineItemViewModel())
//}
