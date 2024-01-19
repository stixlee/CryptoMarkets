//
//  SummaryPanelView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/17/24.
//

import SwiftUI

struct SummaryPanelView: View {
    
    @ObservedObject var viewModel: CryptoDetailsViewModel
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: .center, spacing: 0) {
                    Spacer()
                    Text(viewModel.price,
                         format: .currency(code: "USD").precision(.fractionLength(2))
                    )
                    .font(.title)
                    .fontWeight(.semibold)
                }
                .padding(.top, 18)
                Spacer()
            }
        }
        .frame(height: 200)
        .background(Color.panelBackground)
        .cornerRadius(15)

    }
}

//#Preview {
//    SummaryPanelView()
//}
