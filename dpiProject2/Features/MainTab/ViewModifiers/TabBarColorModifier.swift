//
//  TabBarColorModifier.swift
//  dpiProject2
//
//  Created by Jakub Majewski on 27/07/2023.
//

import Foundation
import SwiftUI

struct TabBarColorModifier: ViewModifier {
    var selectedTab: Int
    var opacity: Double

    func body(content: Content) -> some View {
        content
            .background((MainTabbedItems(rawValue: selectedTab)?.bottomBarColor ?? .green).opacity(opacity))
    }
}

extension View {
    func tabBarColorModifier(selectedTab: Int,
                             opacity: Double) -> some View {
        modifier(TabBarColorModifier(selectedTab: selectedTab, opacity: opacity))
    }
}
