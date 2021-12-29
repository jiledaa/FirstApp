import SwiftUI

class ExercisesViewModel: ObservableObject {
    @Published var showSheet = false
    @Published var showHistory = false
    @Published var exerciseSheet: ExerciseSheet?
    @Published var shouldAddExercise = false

    var timerDone = false
    var showSuccess = false
    var showTimer = false
    var index: Int

    var addDoneExercise: ((LocalizedStringKey) -> Void)?
    var goToNextTab: (() -> Void)?

    var indexLimit: Bool {
        index <= Exercise.exercises.count
    }

    func onDismissLogic() {
        if exerciseSheet == .timer {
            if timerDone, indexLimit {
              //  shouldAddExercise = true
                addDoneExercise?(Exercise.exercises[index].exerciseName)
                timerDone = false
            }
            showTimer = false
            if lastExercise {
                showSuccess = true
                showSheet = true
                exerciseSheet = .success
            } else {
                goToNextTab?()
            }
        } else {
            exerciseSheet = nil
        }
        showTimer = false
    }

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
