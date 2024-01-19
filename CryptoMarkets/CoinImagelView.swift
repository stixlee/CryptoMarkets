//
//  SummaryPanelView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/16/24.
//

import SwiftUI

struct CoinImagelView: View {
    
    @ObservedObject var viewModel: CryptoDetailsViewModel
    var body: some View {
        HStack {
            AsyncImage(
                url: URL(string: viewModel.image),
                content: { image in
                    image.resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(maxWidth: 70, maxHeight: 70)
                },
                placeholder: {
                    Text("")
                }
            )
            Spacer()
        }
        .padding(.top, 24)
        .padding(.leading, 40)
    }
}

#Preview {
    CoinImagelView(viewModel: CryptoDetailsViewModel())
}
