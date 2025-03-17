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

    @Published var activeTab = MainTabItems.home

    func start() {
        let homeCoordinator = HomeCoordinator()
        let calculatorCoordinator = CalculatorCoordinator()
        let settingsCoordinator = SettingsCoordinator()
        let historyCoordinator = HistoryCoordinator()
        let aboutCoordinator = AboutCoordinator()

        [homeCoordinator,
         calculatorCoordinator,
         settingsCoordinator,
         historyCoordinator,
         aboutCoordinator
        ].forEach {
            if let coordinator = $0 as? any Coordinator {
                childCoordinators.append(coordinator)
            }
        }
    }

    // MARK: - RootViews
    var rootView: some View {
        MainTabView(viewModel: MainTabViewModel(coordinator: self),
                    tabCoordinator: self)
    }

    @MainActor
    var homeTabView: some View {
        childCoordinators.first(as: HomeCoordinator.self)?.rootView
    }

    @MainActor
    var calculatorTabView: some View {
        childCoordinators.first(as: CalculatorCoordinator.self)?.rootView
    }

    @MainActor
    var historyTabView: some View {
        childCoordinators.first(as: HistoryCoordinator.self)?.rootView
    }

    @MainActor
    var aboutTabView: some View {
        childCoordinators.first(as: AboutCoordinator.self)?.rootView
    }

    @MainActor
    var settingsView: some View {
        childCoordinators.first(as: SettingsCoordinator.self)?.rootView
    }

    deinit {
        print("Deinit MainTabCoordinator")
    }

    func setCurrentTab(_ tab: MainTabItems) {
        activeTab = tab
    }

    func dismissAll() {
        childCoordinators.forEach { coordinator in
            if let flowCoordinator = coordinator as? (any FlowCoordinator) {
                flowCoordinator.dismissToRoot()
                flowCoordinator.popToRoot()
            }
        }
    }
}
