import Foundation

class WelcomeViewModel: ObservableObject {
    @Published var showHistory = false

    var showHistoryToggle: () {
        showHistory.toggle()
    }
}
