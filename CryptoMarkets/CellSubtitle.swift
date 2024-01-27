//
//  CellSubtitle.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/27/24.
//

import SwiftUI

struct CellSubtitle: View {
    
    let subtitle: String
    let image: String?
    
    var body: some View {
        HStack(alignment: .center, spacing: 2) {
            if let image = image {
                Label {
                    Text(subtitle)
                        .font(.subheadline)
                } icon: {
                    AsyncImage(
                        url: URL(string: image),
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
                Text(subtitle)
                    .font(.caption)
                    .foregroundStyle(Color.gray)
                    .lineLimit(1)

            }
            Spacer()
        }
    }}

#Preview {
    CellSubtitle(subtitle: "Global Market Capitalization", image: nil)
}
