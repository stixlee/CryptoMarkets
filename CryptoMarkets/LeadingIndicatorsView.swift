//
//  LeadingIndicatorsView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/1/24.
//

import SwiftUI

struct LeadingIndicatorsView: View {
    
    @ObservedObject var appState = globalAppState
    @ObservedObject var viewModel: LeadingIndicatorsViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .center) {
                Image(systemName: "exclamationmark.bubble.fill")
                    .font(.headline)
                    .foregroundStyle(.yellow)
                Text(viewModel.label)
                    .font(.headline)
                    .foregroundStyle(Color.primaryFG)
                    .padding(.bottom, 4)
                Spacer()
                Text(viewModel.period)
                    .font(.subheadline)
                    .foregroundStyle(Color.primaryFG)
                
            }
            .padding(.leading, 18)
            .padding(.trailing, 24)
            Group {
                if appState.leadingIndicatorsEnabled {
                    EmptyView()
                } else {
                    VStack(alignment: .center) {
                        Spacer()
                        HStack(alignment: .center) {
                            Spacer()
                            Image(systemName: "lock.fill")
                                .font(.largeTitle)
                            Spacer()
                        }
                        Spacer()
                    }
                    .padding(.top, 18)
                    .frame(height: 96)
                }
            }
            .padding(.bottom, 24)
            
        }
    }
}

#Preview {
    LeadingIndicatorsView(viewModel: LeadingIndicatorsViewModel())
}
