//
//  CryptoSymbolRowView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/7/24.
//

import SwiftUI

struct CryptoSymbolRowView: View {
    
    @ObservedObject var viewModel: CryptoSymbolRowViewModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 2) {
            Label {
                Text("\(viewModel.symbol)")
                    .font(.subheadline)
            } icon: {
                AsyncImage(
                    url: URL(string: viewModel.imageUrlString),
                    content: { image in
                        image.resizable()
                             .aspectRatio(contentMode: .fit)
                             .frame(maxWidth: 12, maxHeight: 12)
                    },
                    placeholder: {
                        Image(systemName: "bitcoinsign.circle.fill")
                            .font(.subheadline)
                            .foregroundColor(Color.orange)
                    }
                )
            }
            Spacer()

        }
    }
}

#Preview {
    CryptoSymbolRowView(viewModel: CryptoSymbolRowViewModel(symbol: "BTC", imageUrlString: "", percentChange: 0.234))
}
