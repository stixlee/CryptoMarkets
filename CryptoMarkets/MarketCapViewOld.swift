//
//  MarketCapView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 12/31/23.
//

import SwiftUI

struct MarketCapViewOld: View {
    var body: some View {
        MarketCapView(marketCapInfoViewModel: MarketCapViewModel())
    }
}

#Preview {
    MarketCapViewOld()
}
