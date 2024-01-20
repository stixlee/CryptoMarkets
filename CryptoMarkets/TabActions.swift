//
//  TabActions.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/19/24.
//

import SwiftUI

final class TabActions {
    
    @ObservedObject var state = appState
    
    func tabSelected(selectedTab: Int) {
        switch selectedTab {
            case 0: appState.currentTab = .markets
            case 1: appState.currentTab = .markets
            case 2: appState.currentTab = .crypto
            case 3: appState.currentTab = .watchlist
            case 4: appState.currentTab = .intelligence
            case 5: appState.currentTab = .profile
            default: appState.currentTab = .markets
        }
    }
}
