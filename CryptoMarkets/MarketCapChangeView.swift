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
        HStack(alignment: .center) {
            Text("Market Capitilization")
                .font(.subheadline)
                .foregroundStyle(Color.primaryFG)
            Image(systemName: viewModel.percentChange >= 0.0 ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill" )
                .font(.subheadline)
                .foregroundColor(viewModel.percentChange >= 0.0 ? Color.green : Color.red)
            Text(
                viewModel.percentChange,
                format: .percent.precision(.fractionLength(2))
            )
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(viewModel.percentChange >= 0.0 ? Color.green : Color.red)
        }
    }
}

#Preview {
    MarketCapChangeView(viewModel: MarketCapViewModel())
}
