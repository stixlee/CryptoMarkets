//
//  CryptoPanelView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/7/24.
//

import SwiftUI

struct CryptoPanelView: View {
    
    var viewModel: CryptoPanelViewModel
        
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(viewModel.title)
                .padding(.leading, 24)
                .font(.subheadline)
            ZStack {
                VStack(alignment: .leading, spacing: 18) {
                    
                    ForEach(viewModel.firstItems()) { viewModel in
                        CryptoPanelItemView(viewModel: viewModel)
                        Divider()
                              .frame(minHeight: 1)
                              .background(Color.gray)
                              .padding(.leading, 24)
                    }
                    CryptoPanelItemView(viewModel: viewModel.lastItem())
                }
            }
            .padding([.top, .bottom], 18)
            .background(Color.panelBG)
                .cornerRadius(15)
        }
    }
    
}
