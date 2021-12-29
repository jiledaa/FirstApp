import Foundation

class WelcomeViewModel: ObservableObject {
    var showHistory: Bool

    init(showHistory: Bool) {
        self.showHistory = showHistory
    }

    var showHistoryToggle: () {
        showHistory.toggle()
    }
}
