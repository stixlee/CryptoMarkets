//
//  TrendingView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 12/31/23.
//

import SwiftUI

struct TrendingView: View {
    
    @ObservedObject var viewModel: TrendingViewModel
    
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
                Text(viewModel.secondaryLabel)
                    .font(.caption)
                    .foregroundStyle(Color.primaryFG)
                
            }
            .padding(.bottom, 24)
            
            ForEach(viewModel.trendingItems) { item in
                TrendingItemView(viewModel: item)
                    .padding(.bottom, 12)
            }
        }
    }
}

//#Preview {
//    TrendingView(viewModel: CryptoListViewModel(label: "Trending"))
//}
