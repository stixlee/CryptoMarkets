//
//  Array+Extensions.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/4/24.
//

import Foundation

extension Array {
    func first(_ elementCount: Int) -> Array {
          let min = Swift.min(elementCount, count)
          return Array(self[0..<min])
    }
    
    func primaryBlock(isQuickLook: Bool) -> Array? {
        if self.isEmpty { return nil }
        if self.count == 1 { return nil }
        if self.count == 2 {
            if let item = self.first {
                return [item]
            } else {
                return nil
            }
        }
        
        if isQuickLook {
            return self.first(2)
        }
        
        return self.first(self.count - 1)
    }
    
    func lastItem(isQuickLook: Bool) -> CellState? {
        if isQuickLook {
            return self.first(3).last as? CellState
        }
        return self.last as? CellState
    }

}
