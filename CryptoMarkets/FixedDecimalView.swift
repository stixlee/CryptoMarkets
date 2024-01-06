//
//  SwiftUIView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/6/24.
//

import SwiftUI

struct FixedDecimalView: View {
    
    @State var value: Decimal
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            HStack(alignment: .center, spacing: 0) {
                Spacer()
                Text(
                    value,
                    format: .percent.precision(.fractionLength(2))
                )
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(value >= 0.0 ? Color.green : Color.red)
            }
            .frame(width: 60)
        }
    }
}

#Preview {
    FixedDecimalView(value: -0.2567)
}
