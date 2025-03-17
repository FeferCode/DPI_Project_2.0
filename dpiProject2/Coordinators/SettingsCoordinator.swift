import SwiftUI

final class SettingsCoordinator: FlowCoordinator {
    weak var finishDelegate: CoordinatorFinishDelegate?

    @Published var childCoordinator: (any Coordinator)?
    @Published var navigationControllers = [NavigationController<SettingsRoute>]()

    init() {
        setupInitialNavigationController()
    }

    func destination(for route: SettingsRoute) -> some View {
        switch route {
        default:
            SettingsView()
        }
    }

    var rootView: some View {
        NavigatingView(
            nc: self.rootNavigationController,
            coordinator: self
        ) {
            SettingsView()
        }
        .environmentObject(self)
    }

    deinit {
        print("Deinit CalculationCoordinator")
    }

}
