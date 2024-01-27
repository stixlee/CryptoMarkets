//
//  CellBackingState.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/27/24.
//

import Foundation

protocol CellBackingState {
    
    associatedtype BackingState
    
    var id: String { get }
    var title: String { get }
    var subtitle: String { get }
    var image: String? { get }
    var value: Decimal { get }
    var percentChange: Decimal { get }
    var showInfoButton: Bool { get }
    var type: GenericPanelType { get }
    
    init(state: BackingState)
}
