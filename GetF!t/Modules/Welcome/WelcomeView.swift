import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var navigationManager: NavigationManager

    var body: some View {
        GeometryReader { geometry in
            Spacer()
            VStack {
                Spacer()
                WelcomeView.images
                Spacer()
                getStartedButton
                    .padding(.bottom)
            }
        }
    }
    
    var getStartedButton: some View {
        RaisedButtonView(buttonText: LocalizedStringProvider.Button.getStarted) {
            navigationManager.goToFirstTab()
        }
        .frame(width: 250, height: 50, alignment: .center)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
