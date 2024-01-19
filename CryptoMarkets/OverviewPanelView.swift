//
//  OverviewPanelView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/19/24.
//

import SwiftUI

struct OverviewPanelView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            HStack() {
                Spacer()
                Text("Line 1")
                Spacer()
            }
            .padding(.top, 18)
            HStack() {
                Spacer()
                Text("Line 2")
                Spacer()
            }
            .padding(.top, 18)
            HStack() {
                Spacer()
                Text("Line 3")
                Spacer()
            }
            .padding([.top, .bottom], 18)
        }
        .background(Color.panelBackground)
        .cornerRadius(15)
    }
}

#Preview {
    OverviewPanelView()
}
