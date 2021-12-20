import Foundation
import SwiftUI

class ExercisesViewModel: ObservableObject {
    @Published var timerDone = false
    @Published var showSuccess = false
    @Published var showSheet = false
    @Published var showHistory = false
    @Published var showTimer = false
    @Published var exerciseSheet: ExerciseSheet?
//    @EnvironmentObject var history: HistoryViewModel
//    @EnvironmentObject var selectedTabManager: SelectedTabManager
    let index: Int
    var indexLimit: Bool {
        index <= Exercise.exercises.count
    }

//    var onDismissLogic: () {
//        if exerciseSheet == .timer {
//            if timerDone, indexLimit {
//                history.addDoneExercise(exercise)
//                timerDone = false
//            }
//            showTimer = false
//            if lastExercise {
//                showSuccess = true
//                showSheet = true
//                exerciseSheet = .success
//            } else {
//                selectedTabManager.goToNextTab()
//            }
//        } else {
//            exerciseSheet = nil
//        }
//        showTimer = false
//    }
//
//    var switchLogic: () {
//        if let exerciseSheet = exerciseViewModel.exerciseSheet, exerciseViewModel.indexLimit {
//            switch exerciseSheet {
//            case .history:
//                HistoryView(showHistory: $exerciseViewModel.showHistory)
//                    .environmentObject(history)
//            case .timer:
//                TimerView()
//            case .success:
//                SuccessView()
//            }
//        }
//    }

    var lastExercise: Bool {
        index + 1 == Exercise.exercises.count
    }

    init(index: Int) {
        self.index = index
    }

    var exercise: LocalizedStringKey {
        Exercise.exercises[index].exerciseName
    }

    var video: String {
        Exercise.exercises[index].videoName
    }

    var startExerciseButtonTapped: () {
        showTimer.toggle()
        showSheet = true
        exerciseSheet = .timer
    }

    var historyButtonTapped: () {
        showSheet = true
        showHistory = true
        exerciseSheet = .history
    }

    enum ExerciseSheet {
        case history, timer, success
    }
}
