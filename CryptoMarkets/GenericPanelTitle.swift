//
//  SwiftUIView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/23/24.
//

import SwiftUI

struct GenericPanelTitle: View {
    
    @State var title: String
    @ObservedObject var state = appState
    
    var chevron: String {
        return state.isLargeCapMoversExpanded ? "chevron.down" : "chevron.up"
    }
    
    var body: some View {
        HStack {
            Text(title)
                .font(.subheadline)
                .foregroundStyle(.primaryForeground)
            Spacer()
            Button("", systemImage: chevron) {
                print("Show More = \(state.isLargeCapMoversExpanded)")
                withAnimation {
                    state.isLargeCapMoversExpanded.toggle()
                }
            }
            .font(.subheadline)
            .foregroundStyle(.primaryForeground)
            
        }
    }
}

#Preview {
    GenericPanelTitle(title: "Large Cap Movers")
}
