//
//  CalculationView.swift
//  dpiProject2
//
//  Created by Jakub Majewski on 20/07/2023.
//

import Combine
import SwiftUI

struct CalculationView: View {
    @State private var width = ""
    @State private var height = ""
    @State private var diagonal = ""


    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ZStack {

            LinearGradient(
                colors: [.indigo.opacity(0.25), .indigo.opacity(0.75)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ).ignoresSafeArea()

            Form {
                Section(header: Text("Screen Dimentions").font(Font.system(size: 18))) {
                    Text("Width pixels")
                    TextField("", text: $width, prompt: Text("Width pixels")
                        .foregroundColor(colorScheme == .dark ? .gray : Color(UIColor.lightGray)))
                        .keyboardType(.numberPad)
                        .toolbar {
                            ToolbarItemGroup(placement: .keyboard) {
                                HStack(alignment: .center) {
                                    Spacer()
                                    Button("Click me 1") {
                                        print("Clicked")
                                        hideKeyboard()
                                    }
                                    Spacer()
                                    Button("Click me 2") {
                                        print("Clicked")
                                        hideKeyboard()
                                    }
                                    Spacer()
                                    Button("Click me 3") {
                                        print("Clicked")
                                        hideKeyboard()
                                    }
                                    Spacer()
                                }
                            }
                        }
                    Text("Height pixels")
                    TextField("", text: $height, prompt: Text("Height pixels")
                        .foregroundColor(colorScheme == .dark ? .gray : Color(UIColor.lightGray)))
                        .keyboardType(.numberPad)

                    Text("Screen diagonal")
                    TextField("", text: $diagonal, prompt: Text("Screen diagonal")
                        .foregroundColor(colorScheme == .dark ? .gray : Color(UIColor.lightGray)))
                        .keyboardType(.decimalPad)

                }
                .listRowBackground(Color.indigo.opacity(0.4))
                .blur(radius: 0.2)
                .bold()

            }
            .scrollContentBackground(.hidden)
            .background(.indigo.opacity(0.4)).blur(radius: 0.2)
            .listStyle(GroupedListStyle())
            .cornerRadius(30)
            .padding(.top, 15)
            .padding(.horizontal, 10)
            .padding(.bottom, 35)
            .foregroundColor(.white)
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


import Combine
extension View {
  var keyboardPublisher: AnyPublisher<Bool, Never> {
    Publishers
      .Merge(
        NotificationCenter
          .default
          .publisher(for: UIResponder.keyboardWillShowNotification)
          .map { _ in true },
        NotificationCenter
          .default
          .publisher(for: UIResponder.keyboardWillHideNotification)
          .map { _ in false })
      .debounce(for: .seconds(0.1), scheduler: RunLoop.main)
      .eraseToAnyPublisher()
  }
}
