//
//  MainTabView.swift
//  dpiProject2
//
//  Created by Jakub Majewski on 20/07/2023.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0

    var body: some View {
        ZStack {
            ZStack(alignment: .bottom) {
                TabView(selection: $selectedTab) {
                    HomeView()
                        .tag(0)

                    CalculationView()
                        .tag(1)

                    HistoryView()
                        .tag(2)

                    AboutView()
                        .tag(3)
                }

                ZStack {
                    HStack {
                        ForEach(MainTabbedItems.allCases, id: \.self) { item in
                            Button {
                                selectedTab = item.rawValue
                            } label: {
                                CustomTabItem(imageName: item.iconName,
                                              title: item.title,
                                              isActive: (selectedTab == item.rawValue))
                                        }
                        }
                    }
                    .padding(6)
                }
                .frame(height: 70)
                .background(TabBarColor().opacity(0.3))
                .animation(.easeInOut(duration: 0.5), value: 0)
                .cornerRadius(35)
                .padding(.horizontal, 26)
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}

extension MainTabView {
    func TabBarColor() -> Color {
        MainTabbedItems(rawValue: selectedTab)?.bottomBarColor ?? .green
    }

    func CustomTabItem(imageName: String,
                       title: String,
                       isActive: Bool) -> some View {

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
        .animation(.linear(duration: isActive ? 0.2 : 0), value: 0)
        .background(isActive ? TabBarColor().opacity(0.6) : .clear)
        .animation(.linear(duration: isActive ? 0.1 : 0), value: 0)
        .cornerRadius(30)
    }
}
