import Combine
import SwiftUI

final class HomeCoordinator: FlowCoordinator {
    weak var finishDelegate: CoordinatorFinishDelegate?

    @Published var childCoordinator: (any Coordinator)?
    @Published var navigationControllers = [NavigationController<HomeRoute>]()

    init() {
        setupInitialNavigationController()
    }

    func destination(for route: HomeRoute) -> some View {
        switch route {
        default:
            HomeView(viewModel: HomeViewModel(coordinator: self))
        }
    }

    var rootView: some View {
        NavigatingView(
            nc: self.rootNavigationController,
            coordinator: self
        ) {
            HomeView(viewModel: HomeViewModel(coordinator: self))
        }
        .environmentObject(self)
    }

    func pushNextScreen() {
//        push(route: .pushed)
    }

    func presentNextScreen() {
//        present(route: .sheeted)
    }

    func presentChild() {
//        present(child: ChildCoordinator())
    }

    deinit {
        print("Deinit HomeTabCoordinator")
    }

}
