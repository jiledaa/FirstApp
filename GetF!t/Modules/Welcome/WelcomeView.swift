import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var navigationManager: NavigationManager

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                WelcomeView.images
                    .padding(.bottom, geometry.size.height * 0.1)
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
