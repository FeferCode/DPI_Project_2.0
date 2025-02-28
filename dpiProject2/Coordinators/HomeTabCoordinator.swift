import Combine
import SwiftUI

final class HomeTabCoordinator: ObservableObject {
    @Published var path: [HomeSteps] = []
    
    func goBack() {
        path.removeLast()
    }
    
    func navigateToHome() {
        path.append(HomeSteps.home)
    }
    
}

extension HomeTabCoordinator: Coordinator {
    @ViewBuilder
    func redirect(_ path: HomeSteps) -> some View {
        switch path {
        case .home:
            let viewModel = HomeViewModel(coordinator: self)
            HomeView(viewModel: viewModel)
        }
    }
}
