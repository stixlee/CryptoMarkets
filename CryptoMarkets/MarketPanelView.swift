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
                    ForEach(viewModel.itemViewModels) { item in
                        MarketPanelItemView(viewModel: item)
                        if item.title != (viewModel.itemViewModels.last?.title ?? "") {
                            Divider()
                                  .frame(minHeight: 1)
                                  .background(Color.gray)
                                  .padding(.leading, 24)
                        }
                    }
                }
            }
            .padding([.top, .bottom], 18)
            .background(Color.panelBG)
                .cornerRadius(15)
        }
    }
    
    private func isLast(item: MarketPanelItemViewModel) -> Bool {
        guard let lastItem = self.viewModel.itemViewModels.last else { return false }
        return item.title == lastItem.title
    }
}

#Preview {
    MarketPanelView(viewModel: MarketPanelViewModel())
}
