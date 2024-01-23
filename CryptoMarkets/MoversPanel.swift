//
//  MoversPanel.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/22/24.
//

import SwiftUI

struct MoversPanel: View {
    
    @ObservedObject var state = appState.largeCapMovers
    
    let title: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .padding(.leading, 24)
                .font(.subheadline)
            ZStack {
                VStack(alignment: .leading, spacing: 18) {
                    if state.movers.isEmpty {
                        EmptyCell()
                    } else {
                        ForEach(leadingItems) { mover in
                            GenericPanelCell(state: mover)
                            Divider()
                                .frame(minHeight: 1)
                                .background(Color.gray)
                                .padding(.leading, 24)
                        }
                        if let lastItem = state.movers.last {
                            GenericPanelCell(state: lastItem)
                        }
                    }
               }
            }
            .padding([.top, .bottom], 18)
            .background(Color.panelBackground)
            .cornerRadius(15)
        }
    }
    
    private var lastIndex: Int {
        return state.movers.count - 1
    }
    
    private var leadingItems: [GenericPanelState] {
        guard state.movers.count > 1 else { return [] }
        let totalItemsInArray = state.movers.count
        return state.movers.first(totalItemsInArray - 1)
    }

}

struct EmptyCell: View {
    
    var body: some View {
        HStack {
            Text("")
            Spacer()
        }
    }
}

//#Preview {
//    MoversPanel()
//}
