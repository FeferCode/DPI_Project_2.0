import SwiftUI

final class HistoryCoordinator: FlowCoordinator {
    weak var finishDelegate: CoordinatorFinishDelegate?

    @Published var childCoordinator: (any Coordinator)?
    @Published var navigationControllers = [NavigationController<HistoryRoute>]()

    init() {
        setupInitialNavigationController()
    }

    func destination(for route: HistoryRoute) -> some View {
        switch route {
        default:
            HistoryView()
        }
    }

    var rootView: some View {
        NavigatingView(
            nc: self.rootNavigationController,
            coordinator: self
        ) {
            HistoryView()
        }
        .environmentObject(self)
    }

    deinit {
        print("Deinit HistoryCoordinator")
    }

}
