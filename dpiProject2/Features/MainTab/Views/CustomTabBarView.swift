//
//  CustomTabBarView.swift
//  dpiProject2
//
//  Created by Jakub Majewski on 27/07/2023.
//

import SwiftUI

struct CustomTabBarView: View {
    @Binding var selectedTab: Int

    var body: some View {
        ZStack {
            HStack {
                ForEach(MainTabbedItems.allCases, id: \.self) { item in
                    Button {
                        selectedTab = item.rawValue
                    } label: {
                        CustomTabItem(imageName: item.iconName,
                                      title: item.title,
                                      isActive: (selectedTab == item.rawValue),
                                      selectedTab: selectedTab)
                                }
                }
            }
            .padding(6)
        }
        .frame(height: 70)
        .tabBarColorModifier(selectedTab: selectedTab, opacity: 0.3)
        .animation(.easeInOut(duration: 0.5), value: 0)
        .cornerRadius(35)
        .padding(.horizontal, 26)
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarView(selectedTab: .constant(0))
    }
}
