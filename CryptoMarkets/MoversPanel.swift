//
//  MoversPanel.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/22/24.
//

import SwiftUI

struct MoversPanel: View {
    
    @ObservedObject var state = appState
    @State var showMore: Bool = true
    
    let title: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            GenericPanelTitle(title: title)
                .padding(.leading, 24)
                .font(.subheadline)
            ZStack {
                VStack(alignment: .leading, spacing: 18) {
                    if state.largeCap.movers.isEmpty {
                        EmptyCell()
                    } else {
                        ForEach(leadingItems) { mover in
                            GenericPanelCell(state: mover)
                            Divider()
                                .frame(minHeight: 1)
                                .background(Color.gray)
                                .padding(.leading, 24)
                        }
                        if let lastItem = state.largeCap.movers.last {
                            GenericPanelCell(state: lastItem)
                        }
                    }
               }
            }
            .padding([.top, .bottom], 18)
            .background(state.largeCap.movers.isEmpty ? Color.clear : Color.panelBackground)
            .cornerRadius(15)
        }
    }
    
    private var lastIndex: Int {
        return items.count - 1
    }
    
    private var leadingItems: [GenericPanelState] {
        guard items.count > 1 else { return [] }
        let totalItemsInArray = items.count
        return items.first(totalItemsInArray - 1)
    }
    
    private var items: [GenericPanelState] {
        return state.isLargeCapMoversExpanded ? state.largeCap.movers : state.largeCap.movers.first(3)
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
