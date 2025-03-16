import SwiftUI

struct AboutView: View {
    var body: some View {
        ZStack {
            Text("Hello, AboutView!")
            LinearGradient(
                colors: [.blue.opacity(0.25), .blue.opacity(0.75)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ).ignoresSafeArea()
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
