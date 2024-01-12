//
//  PanelView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/11/24.
//

import SwiftUI

struct PanelView: View {
    
    @ObservedObject var panelViewModel: PanelViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(panelViewModel.title)
                .padding(.leading, 24)
                .font(.subheadline)
            ZStack {
                VStack(alignment: .leading, spacing: 18) {
                    
                    ForEach(panelViewModel.firstItems()) { viewModel in
                        PanelItemView(viewModel: viewModel)
                        Divider()
                              .frame(minHeight: 1)
                              .background(Color.gray)
                              .padding(.leading, 24)
                    }
                    if panelViewModel.lastItem() != nil {
                        PanelItemView(viewModel: panelViewModel.lastItem()!)
                    }
                }
            }
            .padding([.top, .bottom], 18)
            .background(Color.panelBG)
                .cornerRadius(15)
        }
    }
}

#Preview {
    PanelView(panelViewModel: PanelViewModel())
}
