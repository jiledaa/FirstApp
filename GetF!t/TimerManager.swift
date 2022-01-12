import Foundation
import SwiftUI

class TimerManager: ObservableObject {
    @Published var timeRemaining = 3
    @Published var selectedTime = 1

    var timeOver: Bool {
       timeRemaining == 0
    }

    let timer = Timer.publish(
        every: 1,
        on: .main,
        in: .common)
        .autoconnect()

    var dropShadowParameter: CGFloat {
        timeOver ? 6 : -6
    }

    var dropHighlightParameter: CGFloat {
        timeOver ? -6 : 6
    }

    var opacity: Double {
        timeOver ? 1 : 0
    }

    func onTimeOver(_ timerValue: Date) -> Void {
        if timeOver {
            timer.upstream.connect().cancel()
        } else {
           timeRemaining -= 1
        }
    }

    func updateSelection(newValue: Int) {
        selectedTime = newValue
        UserDefaults.standard.set(selectedTime, forKey: StringProvider.selectedTime)
    }

    func loadSelection() {
        selectedTime = UserDefaults.standard.integer(forKey: StringProvider.selectedTime)
    }
}
