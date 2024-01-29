//
//  RightSideMenuView.swift
//  CryptoMarkets
//
//  Created by Michael Lee on 1/5/24.
//

import SwiftUI

struct RightSideMenuView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.sideMenuBackround)
                .stroke(.white, style: StrokeStyle(lineWidth: 0.25))
                .frame(width: UIScreen.screenWidth - 100, height: UIScreen.screenHeight - 200)
        }
        .padding(.bottom, 20)
    }
}

#Preview {
    RightSideMenuView()
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

