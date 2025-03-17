import SwiftUI

final class AboutCoordinator: FlowCoordinator {
    weak var finishDelegate: CoordinatorFinishDelegate?

    @Published var childCoordinator: (any Coordinator)?
    @Published var navigationControllers = [NavigationController<AboutRoute>]()

    init() {
        setupInitialNavigationController()
    }

    func destination(for route: AboutRoute) -> some View {
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
            AboutView()
        }
        .environmentObject(self)
    }

    deinit {
        print("Deinit AboutCoordinator")
    }

}
