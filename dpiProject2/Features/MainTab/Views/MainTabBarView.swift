import SwiftUI

struct MainTabBarView: View {
    @Binding var selectedTab: MainTabItems

    var body: some View {
        ZStack {
            HStack {
                ForEach(MainTabItems.allCases, id: \.self) { item in
                    Button {
                        selectedTab = item
                    } label: {
                        MainTabBarViewItem(imageName: item.iconName,
                                      title: item.title,
                                      isActive: (selectedTab == item),
                                           selectedTab: selectedTab.rawValue)
                                }
                }
            }
            .padding(6)
        }
        .tabBarViewModifier(selectedTab: selectedTab.rawValue)
    }
}

#Preview {
    @State var selectedTab: MainTabItems = .home
    MainTabBarView(selectedTab: $selectedTab)
}
