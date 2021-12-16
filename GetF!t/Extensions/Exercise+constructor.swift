import Foundation

extension Exercise {
    static let exercises = [
        Exercise(
            exerciseName: ExerciseEnum.squat.localizedDescription,
            videoName: StringProvider.ExercisesNamesVideo.squat),
        Exercise(
            exerciseName: ExerciseEnum.stepUp.localizedDescription,
            videoName: StringProvider.ExercisesNamesVideo.stepUp),
        Exercise(
            exerciseName: ExerciseEnum.burpee.localizedDescription,
            videoName: StringProvider.ExercisesNamesVideo.burpee),
        Exercise(
            exerciseName: ExerciseEnum.sunSalute.localizedDescription,
            videoName: StringProvider.ExercisesNamesVideo.sunSalute)
    ]
}
