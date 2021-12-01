import Foundation

extension Exercise {
  static let exercises = [
    Exercise(
     exerciseName: NSLocalizedString("Squat", comment: "Wilkommen!"),
      videoName: "squat"),
    Exercise(
      exerciseName: ExerciseEnum.stepUp.rawValue,
      videoName: "step-up"),
    Exercise(
      exerciseName: ExerciseEnum.burpee.rawValue,
      videoName: "burpee"),
    Exercise(
      exerciseName: ExerciseEnum.sunSalute.rawValue,
      videoName: "sun-salute")
  ]
}
