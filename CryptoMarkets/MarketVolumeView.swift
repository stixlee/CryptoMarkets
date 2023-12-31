//
//  MarketVolumeView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 12/31/23.
//

import SwiftUI

struct MarketVolumeView: View {
    
    @ObservedObject var viewModel: MarketVolumeViewModel
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(
                    viewModel.marketVolume,
                    format: .currency(code: "USD").precision(.fractionLength(0))
                )
                .font(.headline)
                .fontWeight(.bold)
                .foregroundStyle(Color.primaryFG)
                .padding(.bottom, 4)
                Text("24h Trading Volume")
                    .font(.subheadline)
                    .foregroundStyle(Color.primaryFG)

            }
            Spacer()
        }
        .padding(.leading, 24)
        .padding(.trailing, 24)
    }}

#Preview {
    MarketVolumeView(viewModel: MarketVolumeViewModel())
}
