//
//  BiggestMoversView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/1/24.
//

import SwiftUI

struct BiggestMoversView: View {
    
    @ObservedObject var viewModel: BiggestMoversViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .center) {
                Image(systemName: "flame.fill")
                    .font(.headline)
                    .foregroundStyle(.red)
                Text("Large Cap Movers")
                    .font(.headline)
                    .foregroundStyle(Color.primaryFG)
                Spacer()
                Text("last 24h")
                    .font(.subheadline)
                    .foregroundStyle(Color.primaryFG)
                
            }
            .padding(.bottom, 24)
            
            ForEach(viewModel.topFiveMovers) { item in
                CryptoLineItemView(viewModel: item)
                    .padding(.bottom, 12)
            }
        }
    }
}

//#Preview {
//    BiggestMoversView(viewModel: CryptoListViewModel(label: "Biggest Movers"))
//}
