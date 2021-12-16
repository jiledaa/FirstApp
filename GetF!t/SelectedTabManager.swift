import Foundation

class SelectedTabManager: ObservableObject {
    @Published var selectedTab = 9

    func selectedTabZero() {
        selectedTab = 0
    }

    func nextTab() {
        selectedTab += 1
    }
}
