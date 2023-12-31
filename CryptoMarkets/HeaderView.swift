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
    
    @State var accentColor: Color
    
    var body: some View {
        VStack {
            ZStack {
                HStack(alignment: .center) {
                    Button {
                        print("Notifications tapped!")
                    } label: {
                        Image(systemName: "bell.fill")
                            .frame(width: 32, height: 32)
                            .foregroundColor(Color.primaryFG)
                    }
                    Spacer()
                }
                .padding(.leading, 8)

                HStack(alignment: .center) {
                    Spacer()
                    Button {
                        print("Three dot tapped!")
                    } label: {
                        Image(systemName: "ellipsis")
                            .frame(width: 32, height: 32)
                            .foregroundColor(Color.primaryFG)
                    }
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
                                .frame(width: 18.0, height: 18.0)
                                .foregroundColor(accentColor)
                                .padding(.trailing, 4)
                        }
                    )
                    Spacer()
                }
            }
            .padding(.bottom, 2)
            .padding(.top, 56)
        }
    }
}

#Preview {
    HeaderView(title: "Market Watch", icon: "Bitcoinsign.circle.fill", accentColor: .orange)
}
