import Foundation

class WelcomeViewModel: ObservableObject {
    var showHistory = false

    var showHistoryToggle: () {
        showHistory.toggle()
    }
}
