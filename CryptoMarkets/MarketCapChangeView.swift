//
//  MarketCapChangeView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 12/31/23.
//

import SwiftUI

struct MarketCapChangeView: View {
    
    @ObservedObject var viewModel: MarketCapViewModel
    
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Text("% Change")
                .font(.caption)
                .foregroundStyle(Color.primaryFG)
                .padding(.trailing, 8)
            Image(systemName: viewModel.percentChange >= 0.0 ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill" )
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
    }
}

#Preview {
    MarketCapChangeView(viewModel: MarketCapViewModel())
}
