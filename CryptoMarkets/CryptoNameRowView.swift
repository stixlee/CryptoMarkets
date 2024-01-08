//
//  CryptoNameRowView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/7/24.
//

import SwiftUI

struct CryptoNameRowView: View {
    
    @ObservedObject var viewModel: CryptoPanelItemViewModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 2) {
            Image(systemName: viewModel.percentChange >= 0.0 ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(viewModel.percentChange >= 0.0 ? Color.green : Color.red)
            
            Text(viewModel.name)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color.primaryFG)
            Spacer()

        }
        
    }}

#Preview {
    CryptoNameRowView(viewModel: CryptoPanelItemViewModel(
        name: "Bitcoin",
        symbol: "BTC",
        imageUrlString: "",
        value: 43023.23,
        percentChange: 0.0123)
    )
}
