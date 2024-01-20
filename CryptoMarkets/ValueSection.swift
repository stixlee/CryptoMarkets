//
//  ValueSection.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/20/24.
//

import SwiftUI

struct ValueSection: View {
    
    @ObservedObject var state: MarketPanelState

    var body: some View {
        VStack(alignment: .trailing, spacing: 4) {
            HStack(alignment: .center, spacing: 0) {
                Text(displayValue,
                     format: .currency(code: "USD").precision(.fractionLength(2))
                )
                .font(.subheadline)
                .fontWeight(.semibold)
                Text(valueModifer)
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            HStack(alignment: .center, spacing: 0) {
                Text(state.percentChange >= 0.0 ? "+" : "")
                    .font(.caption)
                    .foregroundStyle(state.percentChange >= 0.0 ? Color.green : Color.red)
                Text(state.percentChange,
                     format: .percent.precision(.fractionLength(2))
                )
                .font(.caption)
                .foregroundStyle(state.percentChange >= 0.0 ? Color.green : Color.red)
            }
        }
        .padding(.trailing, 24)    }
}

#Preview {
    ValueSection(state: MarketPanelState())
}

extension ValueSection {
    
    var displayValue: Decimal {
        let trillion: Decimal = 1000000000000
        let billion: Decimal = 1000000000

        var adjustedValue = state.value / trillion
        if adjustedValue > 1.0 {
            return adjustedValue
        }
        
        adjustedValue = state.value / billion
        if adjustedValue > 1.0 {
            return adjustedValue
        }
        
        return state.value
    }
    
    var valueModifer: String {
        let trillion: Decimal = 1000000000000
        let billion: Decimal = 1000000000

        var adjustedValue = state.value / trillion
        if adjustedValue > 1.0 {
            return ValueModifier.trillion.rawValue
        }
        
        adjustedValue = state.value / billion
        if adjustedValue > 1.0 {
            return ValueModifier.billion.rawValue
        }
        
        return ValueModifier.none.rawValue
    }


}
