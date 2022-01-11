import SwiftUI

struct TimerView: View {
    @StateObject var timerManager = TimerViewManager()
    @EnvironmentObject var navigationManager: NavigationManager
    @StateObject var ratingViewModel = RatingViewModel()

    var body: some View {
        ZStack {
            ModalSheetView(text: navigationManager.titleText, circleX: 0.5, circleY: 0.18) {
                VStack {
                    Spacer()
                    indentView
                        .padding(.top, 120)
                    Spacer()
                    RatingView(ratingViewModel: ratingViewModel)
                        .padding(.bottom)
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
                x: timerManager.dropShadowParameter,
                y: timerManager.dropShadowParameter)
        .shadow(color: ColorProvider.dropHighlight, radius: 6,
                x: timerManager.dropHighlightParameter,
                y: timerManager.dropHighlightParameter)
    }
    
    var timerText: some View {
        Text("\(timerManager.timeRemaining)")
            .font(.system(size: 90, design: .rounded))
            .fontWeight(.heavy)
            .frame(
                minWidth: 180,
                maxWidth: 200,
                minHeight: 180,
                maxHeight: 200)
            .padding()
            .onReceive(timerManager.timer, perform: timerManager.onTimeOver)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
