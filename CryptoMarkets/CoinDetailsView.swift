//
//  CryptoDetailsView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/16/24.
//

import SwiftUI

struct CoinDetailsView: View {
    
    let id: String
    @StateObject var viewModel = CryptoDetailsViewModel()
    @Binding var showDetails: Bool
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    OverviewPanelView()
                        .padding([.leading, .trailing], 18)
                    OverviewPanelView()
                        .padding([.leading, .trailing], 18)
                    OverviewPanelView()
                        .padding([.leading, .trailing], 18)
                    Spacer()
                }
                .padding(.top, 64)

            }
            VStack {
                HStack {
                    Spacer()
                    Button("", systemImage: "xmark") {
                        showDetails.toggle()
                    }
                    .font(.headline)
                    .foregroundStyle(.primaryForeground)
                }
                .padding(.trailing, 24)
                Spacer()
            }
            .padding(.top, 24)
        }
        .task {
            await viewModel.loadData(id: id)
        }


    }

}

#Preview {
    CoinDetailsView(id: "bitcoin", showDetails: .constant(false))
}
