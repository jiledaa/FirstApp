import SwiftUI

struct WelcomeView: View {
    @StateObject var welcomeViewModel = WelcomeViewModel()
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                VStack {
                    WelcomeView.images
                        .padding(150)
                    getStartedButton
                    Spacer()
                    historyButton
                        .sheet(isPresented: $welcomeViewModel.showHistory) {
                            HistoryView()
                        }
                }
                .frame(height: geometry.size.height * 0.7)
            }
        }
    }
    
    var getStartedButton: some View {
        RaisedButton(buttonText: LocalizedStringProvider.Button.getStarted) {
            appState.goToFirstTab()
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
        WelcomeView()
    }
}
