import SwiftUI

class WelcomeViewModel: ObservableObject {
    @State var showHistory = false

    var showHistoryToggle: () {
        showHistory.toggle()
    }
}
