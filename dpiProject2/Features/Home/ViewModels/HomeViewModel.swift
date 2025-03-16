import SwiftUI

final class HomeViewModel: Identifiable, ObservableObject {
    let id = UUID()
    var coordinator: HomeCoordinator
    
    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
    }
}
