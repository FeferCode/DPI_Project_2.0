import SwiftUI

// MARK: - For multiple coordinators like TabCoordinator
protocol CompositionCoordinator: Coordinator {
    var childCoordinators: [any Coordinator] { get set }
}

extension CompositionCoordinator {
    func didFinish(childCoordinator: any Coordinator) {
        childCoordinators.removeAll { $0 === childCoordinator }
    }
}
