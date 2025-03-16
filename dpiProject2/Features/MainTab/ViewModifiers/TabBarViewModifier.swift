import SwiftUI

struct TabBarViewModifier: ViewModifier {
    var selectedTab: Int

    func body(content: Content) -> some View {
        content
            .frame(height: 70)
            .tabBarColorModifier(selectedTab: selectedTab, opacity: 0.3)
            .animation(.easeInOut(duration: 0.5), value: 0)
            .cornerRadius(35)
            .padding(.horizontal, 26)
    }
}

extension View {
    func tabBarViewModifier(selectedTab: Int) -> some View {
        modifier(TabBarViewModifier(selectedTab: selectedTab))
    }
}
