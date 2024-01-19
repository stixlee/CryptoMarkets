//
//  CryptoCellView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/12/24.
//

import SwiftUI

struct CryptoCellView: View {
    
    @ObservedObject var viewModel: CryptoCellViewModel
    @State var showDetails = false
    
    var body: some View {
//        VStack(alignment: .leading, spacing: 0) {
//            HStack(alignment: .center, spacing: 0) {
//                SymbolSectionView(viewModel: viewModel)
//                Spacer()
//                PriceSectionView(viewModel: viewModel)
//                Spacer()
//                DeltaSectionView(viewModel: viewModel)
//            }
//        }
        Grid() {
            GridRow() {
                SymbolSectionView(viewModel: viewModel)
                    .gridColumnAlignment(.leading)
                PriceSectionView(viewModel: viewModel)
                    .gridColumnAlignment(.center)
                DeltaSectionView(viewModel: viewModel)
                    .gridColumnAlignment(.trailing)
            }
        }
        .onTapGesture {
            showDetails.toggle()
        }
        .sheet(isPresented: $showDetails, content: {
            CryptoDetailsView(id: viewModel.id, showDetails: $showDetails)
        })
    }
}

#Preview {
    CryptoCellView(viewModel: CryptoCellViewModel())
}
