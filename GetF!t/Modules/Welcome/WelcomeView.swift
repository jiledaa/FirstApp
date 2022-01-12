import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var navigationManager: NavigationManager

    var body: some View {
            VStack {
                WelcomeView.images
                getStartedButton
                    .padding(.bottom, 40)
            }
    }
    
    var getStartedButton: some View {
        RaisedButtonView(buttonText: LocalizedStringProvider.Button.getStarted) {
            navigationManager.goToFirstTab()
        }

    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
