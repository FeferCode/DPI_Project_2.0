import SwiftUI
import Combine

struct MainTabView: View {
    @ObservedObject var viewModel: MainTabViewModel
    @ObservedObject var tabCoordinator: MainTabCoordinator

    @State private var isKeyboardPresented = false

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $tabCoordinator.activeTab) {
                tabCoordinator.homeTabView
                    .tag(MainTabItems.home)

                CalculationView()
                    .tag(MainTabItems.calculations)

                HistoryView()
                    .tag(MainTabItems.history)

                AboutView()
                    .tag(MainTabItems.info)
            }

            MainTabBarView(selectedTab: $tabCoordinator.activeTab)
                .onReceive(keyboardPublisher) { value in
                    isKeyboardPresented = value
                  }
            }
        }
}

//#Preview {
//    @PreviewValue
//    var ViewModel: MainTabViewModel.self = .init(coordinator: .init())
//    MainTabView(viewModel: ViewModel()
//}
