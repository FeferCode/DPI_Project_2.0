//
//  MainTabbedItems.swift
//  dpiProject2
//
//  Created by Jakub Majewski on 21/07/2023.
//

import Foundation
import SwiftUI

enum MainTabbedItems: Int, CaseIterable {
    case home = 0
    case calculations
    case history
    case info

    var title: String {
        switch self {
        case .home:
            return "Home"
        case .calculations:
            return "Calculator"
        case .history:
            return "History"
        case .info:
            return "Info"
        }
    }

    var iconName: String {
        switch self {
            case .home:
                return "house"
            case .calculations:
                return "arrow.up.left.and.arrow.down.right"
            case .history:
                return "clock"
            case .info:
                return "info.circle"
        }
    }

    var bottomBarColor: Color {
        switch self {
        case .home:
            return .purple
        case .calculations:
            return .indigo
        case .history:
            return .orange
        case .info:
            return .blue
        }

    }
}
