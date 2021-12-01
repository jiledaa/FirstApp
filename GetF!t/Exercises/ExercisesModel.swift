import Foundation

struct Exercise {
  let exerciseName: String
  let videoName: String

  enum ExerciseEnum: String {
    case squat = "Squat"
    case stepUp = "Step Up"
    case burpee = "Burpee"
    case sunSalute = "Sun Salute"
  }
}
