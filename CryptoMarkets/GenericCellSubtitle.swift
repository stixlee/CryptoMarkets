//
//  MarketCellSubtitle.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/20/24.
//

import SwiftUI

struct GenericCellSubtitle: View {
    
    @ObservedObject var state: GenericPanelState
    let actions = MarketCellActions()

    var body: some View {
        HStack(alignment: .center, spacing: 2) {
            if !state.image.isEmpty {
                Label {
                    Text(state.subtitle)
                        .font(.subheadline)
                } icon: {
                    AsyncImage(
                        url: URL(string: state.image),
                        content: { image in
                            image.resizable()
                                 .aspectRatio(contentMode: .fit)
                                 .frame(maxWidth: 12, maxHeight: 12)
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                }
            } else {
                Text(state.subtitle)
                    .font(.caption)
                    .foregroundStyle(Color.gray)
                    .lineLimit(1)
            }
            Spacer()
        }
    }
}

#Preview {
    GenericCellSubtitle(state: GenericPanelState())
}
