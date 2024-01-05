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
    
    @Binding var showSideView: Bool
    
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
                        withAnimation(.easeInOut) {
                            showSideView.toggle()
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .font(.headline)
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
                                .font(.headline)
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

//#Preview {
//    static @State var ssm = false
//    HeaderView(title: "Market Watch", icon: "Market Watch", showSideView: $ssm, accentColor: Color.orange)
////    HeaderView(title: "Market Watch", icon: "Market Watch", accentColor: .orange)
//}
