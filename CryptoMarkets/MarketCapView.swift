//
//  MarketCapView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 12/31/23.
//

import SwiftUI

struct MarketCapView: View {
    var body: some View {
        MarketCapInfoView(marketCapInfoViewModel: MarketCapInfoViewModel())
    }
}

#Preview {
    MarketCapView()
}
