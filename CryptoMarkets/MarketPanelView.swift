//
//  MarketPanelView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/7/24.
//

import SwiftUI

struct MarketPanelView: View {
    
    
    var viewModel: MarketPanelViewModel
        
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(viewModel.title)
                .padding(.leading, 24)
                .font(.subheadline)
            ZStack {
                VStack(alignment: .leading, spacing: 18) {
                    MarketPanelItemView(viewModel: viewModel.itemViewModels[0])
                    Divider()
                        .frame(minHeight: 1)
                        .background(Color.gray)
                        .padding(.leading, 24)
                    MarketPanelItemView(viewModel: viewModel.itemViewModels[1])
                }
            }
            .padding([.top, .bottom], 18)
            .background(Color.panelBG)
                .cornerRadius(15)
        }
    }
}

#Preview {
    MarketPanelView(viewModel: MarketPanelViewModel())
}
