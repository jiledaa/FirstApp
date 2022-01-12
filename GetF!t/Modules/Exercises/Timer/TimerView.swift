import SwiftUI

struct TimerView: View {
    @ObservedObject var exerciseManager: ExerciseManager
    @EnvironmentObject var navigationManager: NavigationManager
    @EnvironmentObject var settingsManager: SettingsManager

    var body: some View {
        ZStack {
            ModalSheetView(text: navigationManager.titleText, circleX: 0.5, circleY: 0.18) {
                VStack {
                    Spacer()
                    indentView
                        .padding(.top, 120)
                    Spacer()
                    RatingView(exerciseManager: exerciseManager)
                        .padding(.bottom)
                }
                .onAppear {
                    exerciseManager.timeRemaining = settingsManager.selectedTime
                }
            }
        }
    }

    @ViewBuilder
    private var indentView: some View {
        IndentView {
            timerText
        }
        .shadow(color: ColorProvider.dropShadow.opacity(0.5), radius: 6,
                x: exerciseManager.dropShadowParameter,
                y: exerciseManager.dropShadowParameter)
        .shadow(color: ColorProvider.dropHighlight, radius: 6,
                x: exerciseManager.dropHighlightParameter,
                y: exerciseManager.dropHighlightParameter)
    }
    
    var timerText: some View {
        Text("\(exerciseManager.timeRemaining)")
            .font(.system(size: 90, design: .rounded))
            .fontWeight(.heavy)
            .frame(
                minWidth: 180,
                maxWidth: 200,
                minHeight: 180,
                maxHeight: 200)
            .padding()
            .onReceive(exerciseManager.timer, perform: exerciseManager.onTimeOver)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(exerciseManager: .init(exercise: .exercises[0]))
    }
}
