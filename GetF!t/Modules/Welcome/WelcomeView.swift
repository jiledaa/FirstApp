import SwiftUI

struct WelcomeView: View {
    @ObservedObject var welcomeViewModel: WelcomeViewModel
    @EnvironmentObject var selectedTabManager: SelectedTabManager
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(titleText: LocalizedStringProvider.WelcomePage.welcome)
                Spacer()
                VStack {
                    WelcomeView.images
                        .padding(150)
                    getStartedButton
                    Spacer()
                    historyButton
                        .sheet(isPresented: $welcomeViewModel.showHistory) {
                            HistoryView(showHistory: $welcomeViewModel.showHistory)
                        }
                }
                .frame(height: geometry.size.height * 0.7)
            }
        }
    }
    
    var getStartedButton: some View {
        RaisedButton(buttonText: LocalizedStringProvider.Button.getStarted) {
            selectedTabManager.goToFirstTab()
        }
        .frame(width: 250, height: 50, alignment: .center)
        .padding(40)
    }
    
    var historyButton: some View {
        Button(action: {
            welcomeViewModel.showHistoryToggle
        }) {
            Text(LocalizedStringProvider.Button.history)
                .fontWeight(.bold)
                .padding([.leading, .trailing], 5)
        }

        .padding(.bottom, 200)
        .buttonStyle(EmbossedButtonStyle())
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(welcomeViewModel: WelcomeViewModel.init())
    }
}
