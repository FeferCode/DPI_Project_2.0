import Foundation
import SwiftUI

enum MainTabItems: Int, CaseIterable {
    case home = 0
    case calculations = 1
    case history = 2
    case about = 3

    var title: String {
        switch self {
        case .home:
            return "Home"
        case .calculations:
            return "Calculator"
        case .history:
            return "History"
        case .about:
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
            case .about:
                return "info.circle"
        }
    }

    var selectedColor: Color {
        switch self {
        case .home:
            return .purple
        case .calculations:
            return .indigo
        case .history:
            return .orange
        case .about:
            return .blue
        }
    }
}
