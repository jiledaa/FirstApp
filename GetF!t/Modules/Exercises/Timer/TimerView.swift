import SwiftUI

struct TimerView: View {
    @ObservedObject var timerViewModel: TimerViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ColorProvider.background
                    .edgesIgnoringSafeArea(.all)
                circle(size: geometry.size)
                    .overlay(
                        GradientBackground()
                            .mask(circle(size: geometry.size))
                    )
                VStack {
                    Text(timerViewModel.exerciseName)
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                        .padding(.top, 20)
                    Spacer()
                    invertIndentView
                    Spacer()
                    RaisedButton(buttonText: LocalizedStringProvider.Button.done) {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .opacity(timerViewModel.opacity)
                    .padding([.leading, .trailing], 30)
                    .padding(.bottom, 60)
                    .disabled(!timerViewModel.timerDone)
                }
            }
        }
    }

    @ViewBuilder
    private var invertIndentView: some View {
        if timerViewModel.timerDone == false {
            IndentView {
                timerText
            }
        } else {
            IndentViewInverted {
                timerText
            }
        }
    }

    var timerText: some View {
        Text("\(timerViewModel.timeRemaining)")
            .font(.system(size: 90, design: .rounded))
            .fontWeight(.heavy)
            .frame(
                minWidth: 180,
                maxWidth: 200,
                minHeight: 180,
                maxHeight: 200)
            .padding()
            .onReceive(timerViewModel.timer, perform: timerViewModel.onTimeOver)
    }

    private func circle(size: CGSize) -> some View {
        Circle()
            .frame(
                width: size.width,
                height: size.height)
            .position(
                x: size.width * 0.5,
                y: -size.width * 0.2)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(timerViewModel: TimerViewModel.init(exerciseName: "Steig auf!"))
    }
}
