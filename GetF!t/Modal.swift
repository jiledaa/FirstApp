import Foundation

enum Modal {
    case timer
    case history
    case successView
}

extension Modal: Identifiable {
    var id: Self { self }
}
