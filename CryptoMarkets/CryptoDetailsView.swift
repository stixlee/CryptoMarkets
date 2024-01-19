//
//  CryptoDetailsView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/16/24.
//

import SwiftUI

struct CryptoDetailsView: View {
    
    let id: String
    @StateObject var viewModel = CryptoDetailsViewModel()
    @Binding var showDetails: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ScrollView {
                ZStack {
                    CoinInfoView(viewModel: viewModel)
                        .padding([.leading, .trailing], 18)
                        .offset(y: 60)
                    
                    // Image
                    VStack(alignment: .leading) {
                        CoinImagelView(viewModel: viewModel)
                        Spacer()
                    }
                    
                }
//                .ignoresSafeArea()
            }
        }
        .ignoresSafeArea()
        .background(.thinMaterial)
        .task {
            await viewModel.loadData(id: id)
        }

    }

}

//#Preview {
//    CryptoDetailsView(viewModel: CryptoDetailsViewModel(id: "bitcoin"), showDetails: .constant(false))
//}
