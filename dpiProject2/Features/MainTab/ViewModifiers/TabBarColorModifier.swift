import SwiftUI

struct TabBarColorModifier: ViewModifier {
    var selectedTab: Int
    var opacity: Double

    func body(content: Content) -> some View {
        content
            .background((MainTabItems(rawValue: selectedTab)?.selectedColor ?? .green).opacity(opacity))
    }
}

extension View {
    func tabBarColorModifier(selectedTab: Int,
                             opacity: Double) -> some View {
        modifier(TabBarColorModifier(selectedTab: selectedTab, opacity: opacity))
    }
}
