//
//  HeaderVIewModel.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/12/24.
//

import SwiftUI

@Observable final class HeaderViewModel: ObservableObject {
    
    var tabId: Int
    var title: String
    var icon: String
    var showSideMenu: Bool
    var accentColor: Color
    
    init(tabId: Int, title: String, icon: String, showSideMenu: Bool, accentColor: Color) {
        self.tabId = tabId
        self.title = title
        self.icon = icon
        self.showSideMenu = showSideMenu
        self.accentColor = accentColor
    }
    
    init() {
        self.tabId = 0
        self.title = "Generic"
        self.icon = ""
        self.showSideMenu = false
        self.accentColor = .clear
    }
    
    func didTapHamburgerMenu() {
        print("DEBUG: Hamburger Menu tapped")
    }
    
    func didTapNotifications() {
        print("DEBUG: Notifications tapped on tab: \(tabId)")
    }

    
}
