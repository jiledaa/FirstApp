import Foundation
import SwiftUI

class AppState: ObservableObject {
    @Published var selectedTab = 9
    @Published var titleText: LocalizedStringKey = LocalizedStringProvider.WelcomePage.welcome

    func exerciseName() {
        switch selectedTab {
        case 0: titleText = LocalizedStringProvider.ExercisesNames.squat
        case 1: titleText = LocalizedStringProvider.ExercisesNames.stepUp
        case 2: titleText = LocalizedStringProvider.ExercisesNames.burpee
        default: titleText = LocalizedStringProvider.ExercisesNames.sunSalute
        }
    }

    func goToWelcomeView() {
        selectedTab = 9
        titleText = LocalizedStringProvider.WelcomePage.welcome
    }

    func goToFirstTab() {
        selectedTab = 0
        titleText = LocalizedStringProvider.ExercisesNames.squat
    }

    func goToNextTab() {
        selectedTab += 1
        exerciseName()
    }

    func opacity(_ index: Int) -> Double {
        index == selectedTab ? 0.5 : 0
    }

    func goTo(tab: Int) {
        selectedTab = tab
        exerciseName()
    }
}
