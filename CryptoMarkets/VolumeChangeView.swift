//
//  VolumeChangeView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/2/24.
//

import SwiftUI

struct VolumeChangeView: View {
    
    @ObservedObject var viewModel: MarketVolumeViewModel
    
    var body: some View {
        HStack(alignment: .center) {
            Text("Global Trading Volume")
                .font(.subheadline)
                .foregroundStyle(Color.primaryFG)
            Image(systemName: viewModel.volumeChange >= 0.0 ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill" )
                .font(.subheadline)
                .foregroundColor(viewModel.volumeChange >= 0.0 ? Color.green : Color.red)
            Text(
                viewModel.volumeChange,
                format: .percent.precision(.fractionLength(2))
            )
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(viewModel.volumeChange >= 0.0 ? Color.green : Color.red)
        }
    }
}

//#Preview {
//    VolumeChangeView()
//}
