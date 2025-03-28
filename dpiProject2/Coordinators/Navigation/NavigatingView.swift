import SwiftUI

struct NavigatingView<SomeCoordinator: FlowCoordinator>: View {

    @StateObject var nc: NavigationController<SomeCoordinator.Route>
    @StateObject var coordinator: SomeCoordinator

    var content: () -> any View

    var body: some View {
        NavigationStack(path: $nc.navigationPath) {
            AnyView(content())
                .navigationDestination(for: SomeCoordinator.Route.self) {
                    coordinator.destination(for: $0)
                }
        }
        .sheet(isPresented: nc.isPresenting(with: .sheet())) {
            let detents = nc.presentedRoute?.navigationType.presentationType?.detents
            viewToPresent
                .presentationDetents(detents ?? .init())
        }
        .fullScreenCover(isPresented: nc.isPresenting(with: .fullScreenCover)) {
            viewToPresent
        }
        .sheet(isPresented: coordinator.shouldPresentChild(from: nc)) {
            if let childCoordinator = coordinator.childCoordinator {
                AnyView(childCoordinator.rootView)
            }
        }
    }

    @ViewBuilder
    private var viewToPresent: some View {
        if let route = nc.presentedRoute {
            NavigatingView(
                nc: coordinator.topNavigationController,
                coordinator: coordinator
            ) {
                coordinator.destination(for: route)
            }
        }
    }

}
