import Foundation

enum Modal {
    case history
    case successView
}

extension Modal: Identifiable {
    var id: Self { self }
}

