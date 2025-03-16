import Foundation
import SwiftUI

protocol Coordinator: ObservableObject, CoordinatorFinishDelegate {
    associatedtype Content: View

    @MainActor @ViewBuilder var rootView: Content { get }

    var finishDelegate: CoordinatorFinishDelegate? { get set }

    func finish()
}

extension Coordinator {
    func finish() {
        finishDelegate?.didFinish(childCoordinator: self)
    }
}

// MARK: - Finish delegate
protocol CoordinatorFinishDelegate: AnyObject {
    func didFinish(childCoordinator: any Coordinator)
}
