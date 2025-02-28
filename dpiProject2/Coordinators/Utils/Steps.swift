protocol Steps: Equatable, Hashable {}

enum MainTabSteps: Steps {
    case mainTab
}

enum HomeSteps: Steps {
    case home
//    case details
}

enum CalculatorSteps: Steps {
    case calculate
}

enum HistorySteps: Steps {
    case item
}

enum InfoSteps: Steps {
    case info
}

enum SettingsSteps: Steps {
    case Settings
}

extension MainTabSteps: Identifiable {
    var id: String {
        switch self {
        case .mainTab: "MainTab"
        }
    }
}

extension HomeSteps: Identifiable {
    var id: String {
        switch self {
        case .home: "home"
//        case .details: "details"
        }
    }
}

extension HistorySteps: Identifiable {
    var id: String {
        switch self {
        case .item:
            "item"
        }
    }
}
