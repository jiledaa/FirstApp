import SwiftUI

struct ExercisesViewModel {
    var index: Int

    var indexLimit: Bool {
        index <= Exercise.exercises.count
    }

    var videoURL: URL? {
        Bundle.main.url(
            forResource: Exercise.exercises[index].videoName,
            withExtension: "mp4")
    }
}
