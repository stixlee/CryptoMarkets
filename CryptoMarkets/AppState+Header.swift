//
//  AppState+Header.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/19/24.
//

import Foundation

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

    
}
