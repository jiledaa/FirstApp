import Foundation
import SwiftUI

class NavigationManager: ObservableObject {
    @Published var selectedTab = -1
    @Published var titleText: LocalizedStringKey = LocalizedStringProvider.WelcomePage.welcome
    @Published var modal: Modal?
    @Published var exerciseManagerProvider = ExerciseManagerProvider(managers: Exercise.allCases.map(ExerciseManager.init))
    // MARK: - navigation
    let maxTabs = Exercise.allCases.count

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

    func nameForHistorySave() -> String {
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
            // TODO: cekovat pri novych verzich
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) { [weak self] in
                self?.modal = .success
            }
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

    func onShowSettingsTapped() {
        modal = .settings
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

    // MARK: - settings

    
//    var exerciseIndexes: [Int]
//
//    func getIndexForSelectedTab(exerciseList: [(LocalizedStringKey, String)]) {
//        for (exerciseIndex, exercise) in exerciseList.enumerated() {
//
//            print("nazdaar\(exerciseIndexes) and \(exercise)")
//        }
//        ForEach(Array(exerciseList.enumerated()), id:\.self) { index, exerciseList in
//            exerciseIndexes.insert(exerciseIndex, at: index)
//        }
//    }
}



