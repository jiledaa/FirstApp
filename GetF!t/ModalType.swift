import Foundation

enum ModalType {
    case timer
    case history
    case successView
}

extension ModalType: Identifiable {
    var id: Self { self }
}
