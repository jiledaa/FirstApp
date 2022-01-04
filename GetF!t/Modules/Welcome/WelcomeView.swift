import SwiftUI

struct WelcomeView: View {
    @StateObject var welcomeViewModel = WelcomeViewModel()
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        GeometryReader { geometry in
            Spacer()
            VStack {
                WelcomeView.images
                    .padding(.top, 200)
                getStartedButton
                Spacer()
                //                    historyButton
                //                        .sheet(isPresented: $welcomeViewModel.showHistory) {
                //                            HistoryView()
                //                        }
            }
        }
    }
    
    var getStartedButton: some View {
        RaisedButton(buttonText: LocalizedStringProvider.Button.getStarted) {
            appState.goToFirstTab()
        }
        .frame(width: 250, height: 50, alignment: .center)
        .padding(.top, 110)
    }
    
    //    var historyButton: some View {
    //        Button(action: {
    //            welcomeViewModel.showHistoryToggle
    //        }) {
    //            Text(LocalizedStringProvider.Button.history)
    //                .fontWeight(.bold)
    //                .padding([.leading, .trailing], 5)
    //        }
    //
    //        .padding(.bottom, 200)
    //        .buttonStyle(EmbossedButtonStyle())
    //    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
