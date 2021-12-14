import Foundation
import SwiftUI

class TimerViewModel: ObservableObject {
    @Published var timeRemaining = 3
    @Published var timerDone = false

    let exerciseName: LocalizedStringKey
    let timer = Timer.publish(
        every: 1,
        on: .main,
        in: .common)
        .autoconnect()

    init(exerciseName: LocalizedStringKey) {
        self.exerciseName = exerciseName
    }



    var opacity: Double {
        timerDone ? 1 : 0
    }

    func onTimeOver(_ timerValue: Date) -> Void {
        if timeRemaining > 0 {
            timeRemaining -= 1
        } else {
            timerDone = true
        }
    }
}
