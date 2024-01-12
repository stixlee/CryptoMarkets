//
//  HeaderView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 12/30/23.
//

import SwiftUI

struct HeaderView: View {
    
    @ObservedObject var viewModel: HeaderViewModel
    
    var body: some View {
        VStack {
            ZStack {
                HStack(alignment: .center) {
                    Button {
                        print("Notifications tapped!")
                    } label: {
                        Image(systemName: "bell.fill")
                            .frame(width: 32, height: 32)
                            .foregroundColor(Color.primaryForeground)
                    }
                    Spacer()
                }
                .padding(.leading, 8)

                HStack(alignment: .center) {
                    Spacer()
                    Button {
                        withAnimation(.easeInOut) {
                            viewModel.didTapHamburgerMenu()
//                            viewModel.showSideView.toggle()
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .font(.headline)
                            .foregroundColor(Color.primaryForeground)
                    }
                }
                .padding(.trailing, 8)
                HStack(alignment: .center) {
                    Spacer()
                    Label(
                        title: {
                            Text(viewModel.title)
                                .font(.headline)
                        },
                        icon: {
                            Image(systemName: viewModel.icon)
                                .font(.headline)
                                .foregroundColor(viewModel.accentColor)
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
    HeaderView(viewModel: HeaderViewModel())
}

//#Preview {
//    static @State var ssm = false
//    HeaderView(title: "Market Watch", icon: "Market Watch", showSideView: $ssm, accentColor: Color.orange)
////    HeaderView(title: "Market Watch", icon: "Market Watch", accentColor: .orange)
//}
