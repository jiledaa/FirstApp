import SwiftUI

struct TimerView: View {
    @StateObject var timerViewModel = TimerViewModel()
    @EnvironmentObject var navigationManager: NavigationManager
    
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
                    Text(navigationManager.titleText)
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                        .padding(.top)
                    Spacer()
                    indentView
                    Spacer()
                    doneButton
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
                x: timerViewModel.dropShadowParameter,
                y: timerViewModel.dropShadowParameter)
        .shadow(color: ColorProvider.dropHighlight, radius: 6,
                x: timerViewModel.dropHighlightParameter,
                y: timerViewModel.dropHighlightParameter)
    }

    private var doneButton: some View {
        RaisedButton(buttonText: LocalizedStringProvider.Button.done) {
            presentationMode.wrappedValue.dismiss()
            navigationManager.goToNextTab()
        }
        .opacity(timerViewModel.opacity)
        .padding([.leading, .trailing], 30)
        .padding(.bottom, 60)
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
        TimerView()
            .environmentObject(NavigationManager())
    }
}
