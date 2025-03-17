import SwiftUI

protocol Routable: Equatable, Hashable {
    var navigationType: NavigationType { get }
}

// MARK: - Route for MainTabView - Start Application
enum MainRoute: Routable {
    
    case mainTab
    case calculator
    case settings
    case history
    case info

    var navigationType: NavigationType {
        switch self {
        case .mainTab:
            .present(.fullScreenCover)
        case .calculator:
            .present(.fullScreenCover)
        case .settings:
            .present(.fullScreenCover)
        case .history:
            .present(.fullScreenCover)
        case .info:
            .present(.fullScreenCover)
        }
    }
}

extension MainRoute: Identifiable {
    var id: String {
        switch self {
        case .mainTab: "MainTab"
        case .calculator: "Calculator"
        case .settings: "Settings"
        case .history: "History"
        case .info: "Info"
        }
    }
}

// MARK: - Home Route
enum HomeRoute: Routable {
//    case home
//    case details

    var navigationType: NavigationType {
        switch self {
        }
    }
}

extension HomeRoute: Identifiable {
    var id: String {
        switch self {
//        case .home: "home"
//        case .details: "details"
        }
    }
}

// MARK: - Calculator Route
enum CalculatorRoute: Routable {
    case calculate

    var navigationType: NavigationType {
        switch self {
        case .calculate:
            .present(.fullScreenCover)
        }
    }
}

extension CalculatorRoute: Identifiable {
    var id: String {
        switch self {
        case .calculate: "calculate"
        }
    }
}

// MARK: - History Route
enum HistoryRoute: Routable {
    case item

    var navigationType: NavigationType {
        switch self {
        case .item:
            .present(.fullScreenCover)
        }
    }
}

extension HistoryRoute: Identifiable {
    var id: String {
        switch self {
        case .item:
            "item"
        }
    }
}

// MARK: - Info Route
enum AboutRoute: Routable {
    case info

    var navigationType: NavigationType {
        switch self {
        case .info:
            .present(.fullScreenCover)
        }
    }
}

// MARK: - Settings Route
enum SettingsRoute: Routable {
    case Settings

    var navigationType: NavigationType {
        switch self {
        case .Settings:
            .present(.fullScreenCover)
        }
    }
}
