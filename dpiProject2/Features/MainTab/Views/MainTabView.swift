import SwiftUI
import Combine

struct MainTabView: View {
    @ObservedObject var viewModel: MainTabViewModel
    @ObservedObject var tabCoordinator: MainTabCoordinator

    @State private var isKeyboardPresented = false

    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                TabView(selection: $tabCoordinator.activeTab) {
                    tabCoordinator.homeTabView
                        .tag(MainTabItems.home)

                    tabCoordinator.calculatorTabView
                        .tag(MainTabItems.calculations)

                    tabCoordinator.historyTabView
                        .tag(MainTabItems.history)

                    tabCoordinator.aboutTabView
                        .tag(MainTabItems.about)
                }.navigationBarItems(leading: Button {
                    print("Button tapped")
                    tabCoordinator.presentSettings()
                    }label: {
                        Image(systemName: "text.justify")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 30, height: 20)
                            .foregroundColor(.white)
                    })

                MainTabBarView(selectedTab: $tabCoordinator.activeTab)
                    .onReceive(keyboardPublisher) { value in
                        isKeyboardPresented = value
                    }
            }.ignoresSafeArea(.keyboard, edges: .all)
        }
    }

    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    let coordinator = MainTabCoordinator()
    let viewModel = MainTabViewModel(coordinator: coordinator)
    MainTabView(viewModel: viewModel,
                tabCoordinator: coordinator)
}
