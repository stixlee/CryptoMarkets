//
//  HeaderView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 12/30/23.
//

import SwiftUI

struct HeaderView: View {
    
    var title: String
    var icon: String
    
    var body: some View {
        VStack {
            ZStack {
                HStack(alignment: .center) {
                    Image(systemName: "bell.fill")
                        .frame(width: 32, height: 32)
                    Spacer()
                }
                .padding(.leading, 8)

                HStack(alignment: .center) {
                    Spacer()
                    Image(systemName: "ellipsis")
                        .frame(width: 32, height: 32)
                }
                .padding(.trailing, 8)
                HStack(alignment: .center) {
                    Spacer()
                    Label(
                        title: {
                            Text(title)
                                .font(.headline)
                        },
                        icon: {
                            Image(systemName: icon)
                                .resizable()
                                .frame(width: 32.0, height: 32.0)
                                .foregroundColor(.orange)
                        }
                    )
                    Spacer()
                }
            }
            .padding(.bottom, 2)
            .padding(.top, 56)
            Divider()
                .frame(height: 0.5)
                .background(Color.primaryFG)
        }
    }
}

#Preview {
    HeaderView(title: "Market Watch", icon: "Bitcoinsign.circle.fill")
}
