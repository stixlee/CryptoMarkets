//
//  SymbolSectionView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/12/24.
//

import SwiftUI

struct SymbolSectionView: View {
    
    @ObservedObject var viewModel: CryptoCellViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .center, spacing: 0) {
                Text("\(viewModel.rank)")
                    .font(.caption)
                    .padding(.trailing, 6)
                Label {
                    Text(viewModel.symbol)
                        .font(.subheadline)
                } icon: {
                    AsyncImage(
                        url: URL(string: viewModel.imageURL),
                        content: { image in
                            image.resizable()
                                 .aspectRatio(contentMode: .fit)
                                 .frame(maxWidth: 12, maxHeight: 12)
                        },
                        placeholder: {
                            Image(systemName: "bitcoinsign.circle.fill")
                        }
                    )
                }
//                Spacer()
            }
        }
    }
}

#Preview {
    SymbolSectionView(viewModel: CryptoCellViewModel())
}
