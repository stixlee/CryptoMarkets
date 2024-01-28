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
    @State var isQuickLook: Bool
    
    var stateItems: [CellState] {
        if type == .market {
            return appState.latestQuote.cellState
        }
        if type == .largeCapMovers {
            return []
        }
        return []
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
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
