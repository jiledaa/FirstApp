import Foundation

enum Modal {
    case history
    case success
    case settings
}

extension Modal: Identifiable {
    var id: Self { self }
}

