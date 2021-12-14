import Foundation

class TimerViewModel: ObservableObject {
    @Published var timeRemaining = 3
    @Published var timerDone: Bool

    let exerciseName: LocalizedStringKey
    let timer = Timer.publish(
        every: 1,
        on: .main,
        in: .common)
        .autoconnect()

    init() {

    }

    func invertIndentView(_ timerText) {
        if timerDone == false {
            IndentView {
                timerText
            }
        } else {
            IndentViewInverted {
                timerText
            }
        }
    }

    func opacity() {
        .opacity(timerDone ? 1 : 0)
    }

    func onTimeOver() { _ in
        if self.timeRemaining > 0 {
            self.timeRemaining -= 1
        } else {
            timerDone = true
        }
    }
}
