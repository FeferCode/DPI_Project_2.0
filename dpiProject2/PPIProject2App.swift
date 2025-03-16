import SwiftUI

@main
struct PPIProject2App: App {

    @StateObject var appCoordinator = AppCoordinator()

    private var mainTabCoordinator: MainTabCoordinator {
        appCoordinator.mainTabCoordinator
    }

    var body: some Scene {
        WindowGroup {
            mainTabCoordinator.rootView
        }
    }
}
