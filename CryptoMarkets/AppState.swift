//
//  AppState.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/1/24.
//

import Foundation

let globalAppState = AppState.shared
final class AppState: ObservableObject {
    
    static fileprivate let shared: AppState = AppState()
    
    private init() { }
    
    var leadingIndicatorsEnabled: Bool = false
}
