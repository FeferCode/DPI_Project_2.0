import SwiftUI

extension View {
    func homeViewStyle() -> some View {
        self.modifier(HomeViewModifier())
    }
}

struct HomeViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scrollContentBackground(.hidden)
            .background(.purple.opacity(0.4)).blur(radius: 0.2)
            .listStyle(GroupedListStyle())
            .cornerRadius(30)
            .padding(.top, 15)
            .padding(.horizontal, 10)
            .padding(.bottom, 35)
            .foregroundColor(.white)
            .bold()
    }
}
