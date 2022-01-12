import SwiftUI

class ExerciseManagerProvider: ObservableObject {
    let managers: [ExerciseManager]

    init(managers: [ExerciseManager]) {
        self.managers = managers
    }
}
