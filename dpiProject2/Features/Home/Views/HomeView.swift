import SwiftUI

struct HomeView: View {

    @ObservedObject var viewModel: HomeViewModel
//    @StateObject private var viewModel: HomeViewModel

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [MainTabItems.home.selectedColor.opacity(0.25), MainTabItems.home.selectedColor.opacity(0.75)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea(.all)

            List {
                Section(header: Text("Section 1")
                    .font(Font.system(size: 18))) {
                    Text("Item 1")
                    Text("Item 2")
                    Text("Item 3")
                    Text("Item 4")
                    Text("Item 5")
                }.listRowBackground(Color.clear)

                Section(header: Text("Section 2")
                    .font(Font.system(size: 18))) {
                    Text("Item 6")
                    Text("Item 7")
                    Text("Item 8")
                    Text("Item 9")
                    Text("Item 10")
                }.listRowBackground(Color.clear)

                Section(header: Text("Section 3")
                    .font(Font.system(size: 18))) {
                    Text("Item 11")
                    Text("Item 12")
                    Text("Item 13")
                    Text("Item 14")
                    Text("Item 15")
                }
                .listRowBackground(Color.clear)

            }.homeViewStyle()
        }
//        .applyNavigation(coordinator: viewModel.coordinator)
    }
}
