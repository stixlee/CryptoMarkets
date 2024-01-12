//
//  TitleRowView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/7/24.
//

import SwiftUI

//struct TitleRowView: View {
//    
//    @ObservedObject var viewModel: MarketPanelItemViewModel
//    
//    var body: some View {
//        HStack(alignment: .center, spacing: 2) {
//            Image(systemName: viewModel.percentChange >= 0.0 ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
//                .font(.caption)
//                .fontWeight(.semibold)
//                .foregroundColor(viewModel.percentChange >= 0.0 ? Color.green : Color.red)
//            
//            Text(viewModel.title)
//                .font(.subheadline)
//                .fontWeight(.semibold)
//                .foregroundStyle(Color.primaryFG)
//            
//            Button {
//                viewModel.didTapInfo()
//            } label: {
//                Image(systemName: "info.circle")
//                    .font(.subheadline)
//                    .foregroundColor(.blue)
//            }
//                .offset(y: -4)
//            
//            Spacer()
//
//        }
//        
//    }
//}
//
//#Preview {
//    TitleRowView(viewModel: MarketPanelItemViewModel(
//        title: "Market Cap",
//        secondaryTitle: "Global Market Capitalization",
//        value: 0.0,
//        percentChange: 0.0123)
//    )
//}
