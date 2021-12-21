import Foundation

class SelectedTabManager: ObservableObject {
    @Published var selectedTab = 9

    func goToWelcomeView() {
        selectedTab = 9
    }

    func goToFirstTab() {
        selectedTab = 0
    }

    func goToNextTab() {
        selectedTab += 1
    }

    func opacity(_ index: Int) -> Double {
        index == selectedTab ? 0.5 : 0
    }

    func indexToSelectedTab(_ index: Int) {
        selectedTab = index
    }

}
