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
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.08, alignment: .center)
                    .padding(.bottom)
            }
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
