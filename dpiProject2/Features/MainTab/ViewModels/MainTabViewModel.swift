import SwiftUI

final class MainTabViewModel: Identifiable, ObservableObject {
    let id = UUID()
    var coordinator: TabAppCoordinator
    
    init(coordinator: TabAppCoordinator) {
        self.coordinator = coordinator
    }
}
