import SwiftUI

struct TimerView: View {
    @StateObject var timerManager = TimerManager()
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var navigationManager: NavigationManager
    @EnvironmentObject var historyViewModel: HistoryViewModel

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ModalSheetHeader(text: navigationManager.titleText, circleX: 0.5, circleY: 0.18)
                VStack {
                    Spacer()
                    indentView
                    Spacer()
                    doneButton
                }
                .onAppear {
                    timerManager.loadSelection()
                    timerManager.timeRemaining = timerManager.selectedTime
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

    private var doneButton: some View {
        RaisedButtonView(buttonText: LocalizedStringProvider.Button.done) {
            presentationMode.wrappedValue.dismiss()
            navigationManager.onDoneTapped()
            historyViewModel.onDoneTapped(navigationManager.titleTextForHistoryStore)
        }
        .opacity(timerManager.opacity)
        .padding([.leading, .trailing], 30)
        .padding(.bottom, 60)
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
