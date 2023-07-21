//
//  CalculationView.swift
//  dpiProject2
//
//  Created by Jakub Majewski on 20/07/2023.
//

import SwiftUI

struct CalculationView: View {
    @State private var width = ""
    @State private var height = ""
    @State private var diagonal = ""

    var body: some View {

        ZStack {
            LinearGradient(
                colors: [.indigo.opacity(0.25), .indigo.opacity(0.75)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ).ignoresSafeArea()

            Form {
                Section(header: Text("Screen Dimentions")) {
                    TextField("Width", text: $width)
                        .keyboardType(.numberPad)
                    TextField("Height", text: $height)
                        .keyboardType(.numberPad)
                    TextField("Screen diagonal", text: $diagonal)
                        .keyboardType(.numberPad)
                }
            }
            .navigationTitle("Simple Form")

            Button(action: calculateDiagonal) {
                Text("Calculate Screen DPI")
            }
        }
    }

    func calculateDiagonal() {
        if let widthValue = Double(width), let heightValue = Double(height) {
            let diagonalValue = sqrt(pow(widthValue, 2) + pow(heightValue, 2))
            diagonal = String(format: "%.2f", diagonalValue)
        } else {
            diagonal = ""
        }
    }
}

struct CalculationView_Previews: PreviewProvider {
    static var previews: some View {
        CalculationView()
    }
}
