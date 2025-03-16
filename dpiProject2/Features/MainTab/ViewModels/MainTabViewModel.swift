import SwiftUI

final class MainTabViewModel: Identifiable, ObservableObject {
    let id = UUID()
    var coordinator: MainTabCoordinator
    
    init(coordinator: MainTabCoordinator) {
        self.coordinator = coordinator
    }
}
