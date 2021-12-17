import Foundation

class SelectedTabManager: ObservableObject {
    @Published var selectedTab = 9

    func goToFirstTab() {
        selectedTab = 0
    }

    func goToNextTab() {
        selectedTab += 1
    }
}
