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

#Preview {
    
    MarketPanelView(viewModel: MarketPanelViewModel(itemViewModels: [
        MarketPanelItemViewModel(
            title: "Market Cap",
            secondaryTitle: "Global Market Capitalization",
            value: 1655999069111, percentChange: 0.0345
        ),
        
        MarketPanelItemViewModel(
            title: "Trading Volume",
            secondaryTitle: "Global Trading Volume  24h",
            value: 45802105363, percentChange: 0.0123
        )
    ]))
}
