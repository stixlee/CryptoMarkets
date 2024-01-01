//
//  BiggestMoversView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/1/24.
//

import SwiftUI

struct BiggestMoversView: View {
    
    @ObservedObject var viewModel: CryptoListViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .center) {
                Image(systemName: "flame.fill")
                    .font(.headline)
                    .foregroundStyle(.red)
                Text(viewModel.label)
                    .font(.headline)
                    .foregroundStyle(Color.primaryFG)
                Spacer()
                Text(viewModel.period)
                    .font(.subheadline)
                    .foregroundStyle(Color.primaryFG)
                
            }
            .padding(.bottom, 24)
            
            ForEach(viewModel.items) { item in
                CryptoLineItemView(viewModel: item)
                    .padding(.bottom, 12)
            }
        }
    }
}

#Preview {
    BiggestMoversView(viewModel: CryptoListViewModel(label: "Biggest Movers"))
}
