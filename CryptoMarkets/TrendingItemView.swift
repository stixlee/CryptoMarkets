//
//  TrendingItemView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/3/24.
//

import SwiftUI

struct TrendingItemView: View {
    
    @State var viewModel: TrendingItemViewModel
    
    var body: some View {
        HStack(alignment: .center) {
            Label {
                Text(viewModel.name+" (\(viewModel.symbol))")
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
                        ProgressView()
                    }
                )
            }
            Spacer()
            Text(viewModel.price)
                .font(.caption)
                .foregroundStyle(Color.primaryFG)
        }
        
    }
}

//#Preview {
//    TrendingItemView()
//}
