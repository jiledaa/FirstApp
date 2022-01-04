import Foundation
import SwiftUI

class AppState: ObservableObject {

// MARK: - ContentView
    enum TabType {
        case welcome
        case exercise
    }

// MARK: - SelectedTab
    @Published var selectedTab = 9
    @Published var titleText: LocalizedStringKey = LocalizedStringProvider.WelcomePage.welcome

    func exerciseName() -> LocalizedStringKey{
        switch selectedTab {
        case 0: titleText = LocalizedStringProvider.ExercisesNames.squat
        case 1: titleText = LocalizedStringProvider.ExercisesNames.stepUp
        case 2: titleText = LocalizedStringProvider.ExercisesNames.burpee
        default: titleText = LocalizedStringProvider.ExercisesNames.sunSalute
        }
        return titleText
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
        _ = exerciseName()
    }

    func opacity(_ index: Int) -> Double {
        index == selectedTab ? 0.5 : 0
    }

    func goTo(tab: Int) {
        selectedTab = tab
        _ = exerciseName()
    }

// MARK: - exercise
    @Published var sheetType: SheetType?
    @Published var showSheet = false
    @Published var showHistory = false

    let exercise = Exercise.exercises
    var timerDone = false
    var showSuccess = false
    var showTimer = false
    enum SheetType {
        case history, timer, success
    }

    func onDismissLogic() {
        if sheetType == .timer {
            if timerDone {
                addDoneExercise?(exerciseName())
                timerDone = false
            }
            showTimer = false
            if exercise.endIndex + 1 == exercise.count {
                showSuccess = true
                showSheet = true
                sheetType = .success
            } else {
                goToNextTab()
            }
        } else {
            sheetType = nil
        }
        showTimer = false
    }

    func startExerciseButtonTapped() {
        showTimer.toggle()
        showSheet = true
        sheetType = .timer
    }

        var showHistoryToggle: () {
            showHistory.toggle()
        }

    func historyButtonTapped() {
        showSheet = true
        showHistory = true
        sheetType = .history
    }

// MARK: - history
    var addDoneExercise: ((LocalizedStringKey) -> Void)?
}


