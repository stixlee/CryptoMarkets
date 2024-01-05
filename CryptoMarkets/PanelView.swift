//
//  PanelView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/5/24.
//

import SwiftUI

struct PanelView: View {
    
    var title: String
    var content: MarketCapView
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
                .padding(.bottom, 4)
            content
                .padding([.top, .bottom], 16)
                .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.primaryFG, lineWidth: 0.5)
                    )
//                .padding(.top, 4)
        }
    }
}

#Preview {
    PanelView(title: "Global Market Cap", content: MarketCapView(viewModel: MarketCapViewModel()))
}
