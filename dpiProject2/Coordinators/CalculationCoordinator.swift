import Combine
import SwiftUI

final class CalculatorCoordinator: FlowCoordinator {
    weak var finishDelegate: CoordinatorFinishDelegate?

    @Published var childCoordinator: (any Coordinator)?
    @Published var navigationControllers = [NavigationController<CalculatorRoute>]()

    init() {
        setupInitialNavigationController()
    }

    func destination(for route: CalculatorRoute) -> some View {
        switch route {
        default:
            CalculationView()
        }
    }

    var rootView: some View {
        NavigatingView(
            nc: self.rootNavigationController,
            coordinator: self
        ) {
            CalculationView()
        }
        .environmentObject(self)
    }

    deinit {
        print("Deinit Coordinator")
    }

}
