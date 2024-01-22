//
//  LargeCapMoversState.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/22/24.
//

import SwiftUI

@Observable final class LargeCapMoversState: ObservableObject {
    var movers: [CryptoSummary]
    
    init(movers: [CryptoSummary]) {
        self.movers = movers
    }
}
