import Foundation
import SwiftUI

struct TabBarItemColorModifier: ViewModifier {
    var selectedTab: Int
    var opacity: Double
    var isActive: Bool

    func body(content: Content) -> some View {
        content
            .background(isActive ? (MainTabbedItems(rawValue: selectedTab)?.bottomBarColor ?? .green).opacity(opacity) : .clear)
    }
}

extension View {
    func customTabColorModifier(selectedTab: Int,
                          opacity: Double,
                          isActive: Bool) -> some View {
        modifier(TabBarItemColorModifier(selectedTab: selectedTab,
                                  opacity: opacity,
                                  isActive: isActive))
    }
}
