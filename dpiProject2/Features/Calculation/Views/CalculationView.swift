import Combine
import SwiftUI

struct CalculationView: View {
    @StateObject private var viewModel = CalculationViewModel()

    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [MainTabItems.calculations.selectedColor.opacity(0.25),
                         MainTabItems.calculations.selectedColor.opacity(0.75)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ).ignoresSafeArea()
            VStack {
                DPIMonitorView(width: 340, height: 200)
                .frame (maxWidth: .infinity, maxHeight: 200)

                Form {
                    Section(header: Text("Screen Dimentions").font(.system(size: 21))) {
                        Text("Width pixels")
                        TextField("", text: viewModel.widthBinding,
                                  prompt: Text("Width pixels")
                            .foregroundColor(colorScheme == .dark ? .gray : Color(UIColor.lightGray)))
                            .keyboardType(.numberPad)
                            .toolbar {
                                ToolbarItemGroup(placement: .keyboard) {
                                    Button("Done") {
                                        hideKeyboard()
                                    }
                                }
                            }

                        Text("Height pixels")
                        TextField("", text: viewModel.heightBinding,
                                  prompt: Text("Height pixels")
                            .foregroundColor(colorScheme == .dark ? .gray : Color(UIColor.lightGray)))
                            .keyboardType(.numberPad)

                        Text("Screen diagonal")
                        TextField("", text: viewModel.diagonalBinding,
                                  prompt: Text("Screen diagonal")
                            .foregroundColor(colorScheme == .dark ? .gray : Color(UIColor.lightGray)))
                            .keyboardType(.decimalPad)
                    }
                    .listRowBackground(Color.indigo.opacity(0.4))
                    .blur(radius: 0.2)
                    .bold()
                }.scrollContentBackground(.hidden) // ToDo <- Add custom viewModifier
                .background(.indigo.opacity(0.4)).blur(radius: 0.2)
                .listStyle(GroupedListStyle())
                .cornerRadius(30)
                .padding(.top, 0)
                .padding(.horizontal, 10)
                .padding(.bottom, 35)
                .foregroundColor(.white)
            }.keyboardDoneButton() // ToDo <- Add custome done button
        }
    }

    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
    }
}

struct CalculationView_Previews: PreviewProvider {
    static var previews: some View {
        CalculationView()
    }
}


struct TextFieldCalculationStyle: TextFieldStyle {
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .padding(10)
            .background(Color(UIColor.systemGray6))
            .cornerRadius(10)
    }
}
