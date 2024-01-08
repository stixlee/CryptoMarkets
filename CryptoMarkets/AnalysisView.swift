//
//  CryptoNewsView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 12/30/23.
//

import SwiftUI

struct AnalysisView: View {
    var body: some View {
        VStack {
            ZStack {
                Color.primaryBG
                VStack {
                    // Header View
//                    HeaderView(title: "In Depth Analysis", icon: "graduationcap.fill", homeViewModel: HomeViewModel(), accentColor: .yellow)
                    
                    // Crypto List View
                    VStack(alignment: .center) {
                        Spacer()
                        HStack(alignment: .center) {
                            Spacer()
                            Text("Coming Soon")
                                .font(.title)
                                .foregroundStyle(Color.primaryFG)
                            Spacer()
                        }
                        Spacer()
                    }
                    Spacer()
                }
            }
            Spacer()
            Divider()
                .padding(0)
        }
        .edgesIgnoringSafeArea([.leading, .trailing, .top])
    }
}

#Preview {
    AnalysisView()
}
