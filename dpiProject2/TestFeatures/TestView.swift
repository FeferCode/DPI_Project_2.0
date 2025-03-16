import SwiftUI

struct TestView: View {
    var body: some View {
        Image(systemName: "arrow.up.left.and.arrow.down.right")
            .resizable()
            .frame(width: 100, height: 100)
            .padding(10)
            .border(.black, width: 3)
            .cornerRadius(5)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
