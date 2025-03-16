import Combine
import SwiftUI

enum MainTabs: Int, CaseIterable {
    case main
    case calculator
    case settings
    case history
}

final class MainTabCoordinator: CompositionCoordinator {

    var childCoordinators = [any Coordinator]()
    var finishDelegate: (any CoordinatorFinishDelegate)?

    let homeCoordinator = HomeCoordinator()

    @Published var activeTab = MainTabItems.home

    func start() {
        let homeCoordinator = HomeCoordinator()
//        let calculatorCoordinator = CalculatorCoordinator()
//        let settingsCoordinator = SettingsCoordinator()
//        let historyCoordinator = HistoryCoordinator()

        [homeCoordinator
//         calculatorCoordinator,
//         settingsCoordinator,
//         historyCoordinator
        ].forEach {
            childCoordinators.append($0)
        }
    }

    var rootView: some View {
        MainTabView(viewModel: MainTabViewModel(coordinator: self),
                    tabCoordinator: self)
    }

    @MainActor
    var homeTabView: some View {
        childCoordinators.first(as: HomeCoordinator.self)?.rootView
    }

    deinit {
        print("Deinit MainTabCoordinator")
    }

    func setCurrentTab(_ tab: MainTabItems) {
        activeTab = tab
    }

    func dismissAll() {
//        childCoordinators.forEach { coordinator in
////            coordinator.dismissToRoot()
//            coordinator.popToRoot()
//        }
    }
}
