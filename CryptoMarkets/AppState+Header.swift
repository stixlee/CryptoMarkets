//
//  AppState+Header.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/19/24.
//

import SwiftUI

extension AppState {
    var headerTitle: String {
        switch currentTab {
            case .markets: return "Crypto Markets"
            case .crypto: return "Crypt Currencies"
            case .watchlist: return "Watchlist"
            case .intelligence: return "Intelligence"
            case .profile: return "Profile"
            default: return ""
        }
    }
    
    var headerIcon: String {
        switch currentTab {
            case .markets: return "house.fill"
            case .crypto: return "bitcoinsign.circle.fill"
            case .watchlist: return "sunglasses.fill"
            case .intelligence: return "graduationcap.fill"
            case .profile: return "person.fill"
            default: return ""
        }
    }
    
    var headerAccentColor: Color {
        switch currentTab {
            case .markets: return .green
            case .crypto: return .orange
            case .watchlist: return .blue
            case .intelligence: return .red
            case .profile: return .yellow
            default: return .clear
        }
    }


    
}
