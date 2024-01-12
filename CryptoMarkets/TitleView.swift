//
//  TitleView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/11/24.
//

import SwiftUI

struct TitleView: View {
    
    @ObservedObject var viewModel: PanelItemViewModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 2) {
            Image(systemName: viewModel.percentChange >= 0.0 ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(viewModel.percentChange >= 0.0 ? Color.green : Color.red)
            
            Text(viewModel.title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color.primaryForeground)
            
            Button {
                viewModel.didTapInfo()
            } label: {
                Image(systemName: "info.circle")
                    .font(.subheadline)
                    .foregroundColor(.blue)
            }
                .offset(y: -4)
            
            Spacer()

        }
    }
}

#Preview {
    TitleView(viewModel: PanelItemViewModel())
}
