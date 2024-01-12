//
//  SubtitleView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/11/24.
//

import SwiftUI

struct SubtitleView: View {
    
    @ObservedObject var viewModel: PanelItemViewModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 2) {
            if !viewModel.image.isEmpty {
                Label {
                    Text(viewModel.subtitle)
                        .font(.subheadline)
                } icon: {
                    AsyncImage(
                        url: URL(string: viewModel.image),
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
                Text(viewModel.subtitle)
                    .font(.caption)
                    .foregroundStyle(Color.gray)
                    .lineLimit(1)
            }
        }
    }
}

#Preview {
    SubtitleView(viewModel: PanelItemViewModel())
}
