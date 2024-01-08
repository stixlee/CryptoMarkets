//
//  CryptoPanelView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/7/24.
//

import SwiftUI

struct CryptoPanelView: View {
    
    var cryptoViewModel: CryptoPanelViewModel
        
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(cryptoViewModel.title)
                .padding(.leading, 24)
                .font(.subheadline)
            ZStack {
                VStack(alignment: .leading, spacing: 18) {
                    
                    CryptoPanelItemView(viewModel:cryptoViewModel.items[0])
                    Divider()
                          .frame(minHeight: 1)
                          .background(Color.gray)
                          .padding(.leading, 24)
                    
                    CryptoPanelItemView(viewModel:cryptoViewModel.items[1])
                    Divider()
                          .frame(minHeight: 1)
                          .background(Color.gray)
                          .padding(.leading, 24)

//                    CryptoPanelItemView(viewModel:cryptoViewModel.items[2])
//                    Divider()
//                          .frame(minHeight: 1)
//                          .background(Color.gray)
//                          .padding(.leading, 24)
//
//                    CryptoPanelItemView(viewModel:cryptoViewModel.items[3])
//                    Divider()
//                          .frame(minHeight: 1)
//                          .background(Color.gray)
//                          .padding(.leading, 24)
//                    
                    CryptoPanelItemView(viewModel:cryptoViewModel.items[2])

                }
            }
            .padding([.top, .bottom], 18)
            .background(Color.panelBG)
                .cornerRadius(15)
        }
    }
    
    func firstItems() -> [CryptoPanelItemViewModel] {
        var items: [CryptoPanelItemViewModel] = []
        for index in 0..<cryptoViewModel.items.count {
            items.append(cryptoViewModel.items[index])
        }
        return items
    }
    
    func lastItem() -> CryptoPanelItemViewModel {
        return cryptoViewModel.items[4]
    }
}

#Preview {
    CryptoPanelView(cryptoViewModel: CryptoPanelViewModel())
}
