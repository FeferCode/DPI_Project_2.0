import SwiftUI

struct MainTabBarViewItem: View {
    var imageName: String
    var title: String
    var isActive: Bool
    var selectedTab: Int

    var body: some View {
        HStack(spacing: 10) {
            Spacer()
            Image(systemName: imageName)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.white)
                .frame(width: 20, height: 20)

            if isActive {
                Text(title)
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.white)
            }
            Spacer()
        }
        .frame(width: isActive ? nil : 55, height: 60)
        .customTabColorModifier(selectedTab: selectedTab, opacity: 0.6, isActive: isActive)
        .cornerRadius(30)
    }
}

struct CustomTabItem_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBarViewItem(imageName: MainTabItems.home.iconName,
                      title: MainTabItems.home.title,
                      isActive: true,
                      selectedTab: 0)
    }
}
