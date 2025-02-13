
import SwiftUI
import Combine

struct MainTabView: View {
    @State private var selectedTab = 0
    @State private var isKeyboardPresented = false

    var body: some View {
        ZStack {
            ZStack(alignment: .bottom) {
                TabView(selection: $selectedTab) {
                    HomeView()
                        .tag(0)

                    CalculationView()
                        .tag(1)

                    HistoryView()
                        .tag(2)

                    AboutView()
                        .tag(3)
                }

                CustomTabBarView(selectedTab: $selectedTab)
                .onReceive(keyboardPublisher) { value in
                    isKeyboardPresented = value
                  }
            }
        }
    }
}

#Preview {
    MainTabView()
}
