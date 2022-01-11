import Foundation
import SwiftUI

class NavigationManager: ObservableObject {
    @Published var selectedTab = -1
    @Published var titleText: LocalizedStringKey = LocalizedStringProvider.WelcomePage.welcome
    @Published var modal: Modal?

    let maxTabs = Exercise.exercises.count

    init() {
        // titleText is now computed from selectedTab
        $selectedTab
            .map(nameForTitle(tab:))
            .assign(to: &$titleText)
    }
    
    private func nameForTitle(tab: Int) -> LocalizedStringKey {
        switch tab {
        case -1: return LocalizedStringProvider.WelcomePage.welcome
        case 0: return LocalizedStringProvider.ExercisesNames.squat
        case 1: return LocalizedStringProvider.ExercisesNames.stepUp
        case 2: return LocalizedStringProvider.ExercisesNames.burpee
        default: return LocalizedStringProvider.ExercisesNames.sunSalute
        }
    }

    func nameForHistory() -> String {
        switch titleText {
        case LocalizedStringProvider.ExercisesNames.squat: return StringProvider.ExercisesNamesVideo.squat
        case LocalizedStringProvider.ExercisesNames.stepUp: return StringProvider.ExercisesNamesVideo.stepUp
        case LocalizedStringProvider.ExercisesNames.burpee: return StringProvider.ExercisesNamesVideo.burpee
        default: return StringProvider.ExercisesNamesVideo.sunSalute
        }
    }
    
    func goToWelcomeView() {
        selectedTab = -1
    }

    func goToFirstTab() {
        selectedTab = 0
    }

    // only called from welcome view and timer view
    func goToNextTab() {
        if selectedTab + 1 == maxTabs {
            modal = .successView
        } else {
            selectedTab += 1
        }
    }

    func goTo(tab: Int) {
        selectedTab = tab
    }

    // MARK: - convenience methods

    func onShowHistoryTapped() {
        modal = .history
    }

    func onStartExerciseTapped() {
        modal = .timer
    }

    func onDoneTapped() {
        goToNextTab()
    }

    // MARK: - UI helpers

    // tab indicator opacity
    func opacity(_ tab: Int) -> Double {
        tab == selectedTab ? 0.5 : 0
    }

    // MARK: - history

    @Published var showHistory = false
    
    var showHistoryToggle: () {
        showHistory.toggle()
    }

    var addDoneExercise: ((LocalizedStringKey) -> Void)?
}

