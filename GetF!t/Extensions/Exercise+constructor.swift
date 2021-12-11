import Foundation

extension Exercise {
  static let exercises = [
    Exercise(
     exerciseName: ExerciseEnum.squat.localizedDescription,
     videoName: LocalizedStringProvider.ExercisesNamesVideo.squat),
    Exercise(
      exerciseName: ExerciseEnum.stepUp.localizedDescription,
      videoName: LocalizedStringProvider.ExercisesNamesVideo.stepUp),
    Exercise(
      exerciseName: ExerciseEnum.burpee.localizedDescription,
      videoName: LocalizedStringProvider.ExercisesNamesVideo.burpee),
    Exercise(
      exerciseName: ExerciseEnum.sunSalute.localizedDescription,
      videoName: LocalizedStringProvider.ExercisesNamesVideo.sunSalute)
  ]
}
