import SwiftUI

extension Exercise: CaseIterable, Equatable, Codable {}

extension Exercise: Identifiable {
    var id: String { videoName }
}

enum Exercise {
    case squat
    case stepUp
    case burpee
    case sunSalute
    
    var name: LocalizedStringKey {
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
    
    var videoName: String {
        switch self {
        case .squat:
            return StringProvider.ExercisesNamesVideo.squat
        case .stepUp:
            return StringProvider.ExercisesNamesVideo.stepUp
        case .burpee:
            return StringProvider.ExercisesNamesVideo.burpee
        case .sunSalute:
            return StringProvider.ExercisesNamesVideo.sunSalute
        }
    }
    
    var image: String {
        switch self {
        case .squat:
            return StringProvider.images.bolt
        case .stepUp:
            return StringProvider.images.arrow
        case .burpee:
            return StringProvider.images.hare
        case .sunSalute:
            return StringProvider.images.sunMax
        }
    }
}
