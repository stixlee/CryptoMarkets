//
//  Header.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/19/24.
//

import SwiftUI

struct Header: View {
    
    @ObservedObject var state: AppState = appState
    
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
//                        withAnimation(.easeInOut) {
//                            viewModel.didTapHamburgerMenu()
////                            viewModel.showSideView.toggle()
//                        }
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
                            Text(state.headerTitle)
                                .font(.headline)
                        },
                        icon: {
                            Image(systemName: state.headerIcon)
                                .font(.headline)
                                .foregroundColor(state.headerAccentColor)
                                .padding(.trailing, 4)
                        }
                    )
                    Spacer()
                }
            }
            .padding(.bottom, 2)
            .padding(.top, 56)
        }    }
}

#Preview {
    Header()
}
