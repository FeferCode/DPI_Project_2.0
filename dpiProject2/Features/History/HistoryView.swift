import SwiftUI

struct HistoryView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [MainTabItems.history.selectedColor.opacity(0.25), MainTabItems.history.selectedColor.opacity(0.75)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea(.all)

            List {
                Section(header: Text("Section 1").font(Font.system(size: 18))) {
                    Text("Item 1")
                    Text("Item 2")
                    Text("Item 3")
                    Text("Item 4")
                    Text("Item 5")
                }.listRowBackground(Color.clear)

                Section(header: Text("Section 2").font(Font.system(size: 18))) {
                    Text("Item 6")
                    Text("Item 7")
                    Text("Item 8")
                    Text("Item 9")
                    Text("Item 10")
                }.listRowBackground(Color.clear)

                Section(header: Text("Section 3").font(Font.system(size: 18))) {
                    Text("Item 11")
                    Text("Item 12")
                    Text("Item 13")
                    Text("Item 14")
                    Text("Item 15")
                }.listRowBackground(Color.clear)
            }
            .scrollContentBackground(.hidden)
            .background(.orange.opacity(0.4)).blur(radius: 0.2)
            .listStyle(GroupedListStyle())
            .cornerRadius(30)
            .padding(.top, 15)
            .padding(.horizontal, 10)
            .padding(.bottom, 35)
            .foregroundColor(.white)
            .bold()

        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
