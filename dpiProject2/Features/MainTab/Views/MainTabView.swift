import SwiftUI
import Combine

struct MainTabView: View {
    
    @ObservedObject var viewModel: MainTabViewModel
    
    @ObservedObject var homeCoordinator = HomeTabCoordinator()
//    @ObservedObject var calculationCoordinator = CalculationCoordinator()
//    @ObservedObject var historyCoordinator = HistoryCoordinator()
//    @ObservedObject var aboutCoordinator = AboutCoordinator()
    
    @State private var selectedTab = 0
    @State private var isKeyboardPresented = false

    var body: some View {
        ZStack {
            ZStack(alignment: .bottom) {
                TabView(selection: $selectedTab) {
                    HomeView(viewModel: HomeViewModel(coordinator: homeCoordinator))
                        .tag(0)

                    CalculationView()
                        .tag(1)

                    HistoryView()
                        .tag(2)

                    AboutView()
                        .tag(3)
                }

                MainTabBarView(selectedTab: $selectedTab)
                .onReceive(keyboardPublisher) { value in
                    isKeyboardPresented = value
                  }
            }
        }
    }
}

#Preview {
//    MainTabView(viewModel: )
}
