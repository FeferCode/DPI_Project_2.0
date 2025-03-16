import Combine
import SwiftUI

// MARK: - AppCoordinator with place for services, configuration etc.
final class AppCoordinator: ObservableObject {

    let mainTabCoordinator = MainTabCoordinator()

    init () {
        mainTabCoordinator.start()
    }
}
