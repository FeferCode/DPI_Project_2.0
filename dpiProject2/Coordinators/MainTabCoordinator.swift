import Combine
import SwiftUI

final class MainTabCoordinator: CompositionCoordinator {

    @Published var childCoordinators = [any Coordinator]()
    @Published var finishDelegate: (any CoordinatorFinishDelegate)?
    @Published var navigationControllers = [NavigationController<SettingsRoute>]()

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

    // ToDo: Implement the following functions to present Settings Coordinator with CompositionCoordinator
    func presentSettings() {
//        childCoordinators.first(as: SettingsCoordinator.self)?.presentChild()
        childCoordinators.first(as: HomeCoordinator.self)?.presentChild()
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
