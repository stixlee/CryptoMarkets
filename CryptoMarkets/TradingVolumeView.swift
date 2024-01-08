//
//  MarketVolumeView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 12/31/23.
//

import SwiftUI

struct TradingVolumeView: View {
    
    @ObservedObject var viewModel: MarketVolumeViewModel
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(
                    viewModel.tradingVolume,
                    format: .currency(code: "USD").precision(.fractionLength(0))
                )
                .font(.headline)
                .fontWeight(.bold)
                .foregroundStyle(Color.primaryFG)
                .padding(.bottom, 4)
                VolumeChangeView(viewModel: viewModel)
            }
            Spacer()
        }
        .padding(.leading, 24)
        .padding(.trailing, 24)
    }}

#Preview {
    TradingVolumeView(viewModel: MarketVolumeViewModel())
}
