import Foundation
import SwiftUI

struct Exercise {
  let exerciseName: LocalizedStringKey
  let videoName: String

  enum ExerciseEnum {
    case squat
    case stepUp
    case burpee
    case sunSalute
      var localizedDescription: LocalizedStringKey {
          switch self {
          case .squat:
          return LocalizedStringProvider.ExercisesNames.squat
          case .stepUp:
          return LocalizedStringProvider.ExercisesNames.stepUp
          case .burpee:
          return LocalizedStringProvider.ExercisesNames.burpee
          case .sunSalute:
          return LocalizedStringProvider.ExercisesNames.sunSalute
          }
      }
  }
}
