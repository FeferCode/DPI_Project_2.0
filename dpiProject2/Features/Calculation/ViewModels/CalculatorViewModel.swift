import SwiftUI

final class CalculatorViewModel: Identifiable, ObservableObject {
    let id = UUID()
    var coordinator: CalculatorCoordinator

    init(coordinator: CalculatorCoordinator) {
        self.coordinator = coordinator
    }
}

class CalculationViewModel: ObservableObject {
    @Published var width: Int = 160
    @Published var height: Int = 100
    @Published var diagonal: Double = 21.0

    var widthBinding: Binding<String> {
        Binding<String>(
            get: { String(self.width) },
            set: { newValue in
                if let value = Int(newValue) {
                    self.width = value
                }
            }
        )
    }

    var heightBinding: Binding<String> {
        Binding<String>(
            get: { String(self.height) },
            set: { newValue in
                if let value = Int(newValue) {
                    self.height = value
                }
            }
        )
    }

    var diagonalBinding: Binding<String> {
        Binding<String>(
            get: { String(self.diagonal) },
            set: { newValue in
                if let value = Double(newValue) {
                    self.diagonal = value
                }
            }
        )
    }
}
