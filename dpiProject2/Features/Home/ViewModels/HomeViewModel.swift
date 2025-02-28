import SwiftUI

final class HomeViewModel: Identifiable, ObservableObject {
    let id = UUID()
    var coordinator: HomeTabCoordinator
    
    init(coordinator: HomeTabCoordinator) {
        self.coordinator = coordinator
    }
}
