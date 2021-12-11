import SwiftUI

struct LocalizedStringProvider {
    struct ExercisesNames {
        static let burpee: LocalizedStringKey = "Burpee"
        static let squat: LocalizedStringKey = "Squat"
        static let stepUp: LocalizedStringKey = "StepUp"
        static let sunSalute: LocalizedStringKey = "SunSalute"

    }

    struct ExercisesNamesVideo {
        static let burpee: String = "Burpee"
        static let squat: String = "Squat"
        static let stepUp: String = "StepUp"
        static let sunSalute: String = "SunSalute"
    }

    struct Button {
        static let getStarted: LocalizedStringKey = "GetStarted"
        static let startExercise: LocalizedStringKey = "StartExercise"
        static let done: LocalizedStringKey = "Done"
        static let history: LocalizedStringKey = "History"
        static let continuE: LocalizedStringKey = "Continue"
    }

    struct WelcomePage {
        static let welcome: LocalizedStringKey = "Welcome"
        static let getfit: LocalizedStringKey = "Getf!t"
        static let getfitPostScript: LocalizedStringKey = "GetfitPostScript"
        static let history: LocalizedStringKey = "History"
        static let continuE: LocalizedStringKey = "Continue"
    }

    struct SuccesPage {
        static let success: LocalizedStringKey = "Success"
        static let glory: LocalizedStringKey = "Glory"
        static let gloryPostScript: LocalizedStringKey = "GloryPostScript"
    }

    struct Error {
        static let couldntFind: LocalizedStringKey = "CouldntFind"
        static let loadingError1: LocalizedStringKey = "LaodingError1"
        static let loadingError2: LocalizedStringKey = "LoadingError2"
    }
}
