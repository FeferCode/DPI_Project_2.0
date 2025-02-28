import Combine
import SwiftUI

final class TabAppCoordinator: ObservableObject {
    @Published var path: [MainTabSteps] = []
    
    func goBack() {
        path.removeLast()
    }
    
    func navigateToHome() {
        path.append(MainTabSteps.mainTab)
    }
    
    func start() -> some View {
        redirect(.mainTab)
    }
}

extension TabAppCoordinator: Coordinator {

    @ViewBuilder
    func redirect(_ path: MainTabSteps) -> some View {
        switch path {
        case .mainTab:
            let viewModel = MainTabViewModel( coordinator: self)
            MainTabView(viewModel: viewModel)
        }
        
    }
}

