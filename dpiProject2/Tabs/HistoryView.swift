//
//  HistoryView.swift
//  dpiProject2
//
//  Created by Jakub Majewski on 20/07/2023.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        ZStack {
            Text("Hello, HistoryView!")
            LinearGradient(
                colors: [.orange.opacity(0.25), .orange.opacity(0.75)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ).ignoresSafeArea()
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
