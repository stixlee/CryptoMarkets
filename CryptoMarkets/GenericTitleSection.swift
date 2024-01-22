//
//  LeadingSection.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/20/24.
//

import SwiftUI

struct GenericTitleSection: View {
    
    @ObservedObject var state: GenericPanelState
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            GenericCellTitle(state: state)
            GenericCellSubtitle(state: state)
        }
    }
}

#Preview {
    GenericTitleSection(state: GenericPanelState())
}
