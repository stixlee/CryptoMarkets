//
//  Panel.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/28/24.
//

import SwiftUI

struct Panel: View {
    
    @ObservedObject var state = appState
    let title: String
    let type: PanelType
    
    var stateItems: [CellState] {
        if type == .market {
            return appState.latestQuote.cellState
        }
        if type == .largeCapMovers {
            return appState.largeCap.moversState
        }
        if type == .mostTraded {
            return appState.largeCap.volumeState
        }
        return []
    }
    
    var isQuickLook: Bool {
        if type == .market { return false }
        
        if type == .largeCapMovers { return !appState.isLargeCapMoversExpanded }
        
        return !appState.isLargeCapMostTradedExpanded
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            GenericPanelTitle(type: type, title: title)
                .padding(.leading, 24)
                .font(.subheadline)
            ZStack {
                VStack(alignment: .leading, spacing: 18) {
                    if let items = stateItems.primaryBlock(isQuickLook: isQuickLook) {
                        ForEach(items, id: \.self) { item in
                            PanelCell(state: item)
                            Divider()
                                .frame(minHeight: 1)
                                .background(Color.gray)
                                .padding(.leading, 24)
                        }

                    }
                    if let lastItem = stateItems.lastItem(isQuickLook: isQuickLook) {
                        PanelCell(state: lastItem)
                    }
                }
            }
            .padding([.top, .bottom], 18)
            .background(Color.panelBackground)
            .cornerRadius(15)
        }
    }
}

//#Preview {
//    Panel()
//}
