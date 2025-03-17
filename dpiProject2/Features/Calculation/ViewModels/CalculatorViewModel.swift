import SwiftUI

final class CalculatorViewModel: Identifiable, ObservableObject {
    let id = UUID()
    var coordinator: CalculatorCoordinator

    init(coordinator: CalculatorCoordinator) {
        self.coordinator = coordinator
    }
}

