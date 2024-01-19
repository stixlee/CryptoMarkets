//
//  CoinInfoView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/17/24.
//

import SwiftUI

struct CoinInfoView: View {
    
    @ObservedObject var viewModel: CryptoDetailsViewModel
    
    var body: some View {
        SummaryPanelView(viewModel: viewModel)
    }
}

//#Preview {
//    CoinInfoView()
//}
