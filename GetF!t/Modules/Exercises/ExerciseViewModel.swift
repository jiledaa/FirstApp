import SwiftUI

struct ExercisesViewModel {
    var exercise: Exercise
    
    var videoURL: URL? {
        Bundle.main.url(
            forResource: exercise.videoName,
            withExtension: "mp4"
        )
    }
}
