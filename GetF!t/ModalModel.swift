import Foundation

enum Modal {
    case timer
    case history
    case success
    case settings
}

extension Modal: Identifiable {
    var id: Self { self }
}

