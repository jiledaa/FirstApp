import SwiftUI

struct WelcomeView: View {
    @State private var showHistory = false
    @EnvironmentObject var selectedTabManager: SelectedTabManager
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(selectedTab: $selectedTabManager.selectedTab,
                    titleText: LocalizedStringProvider.WelcomePage.welcome
                )
                Spacer()
                VStack {
                    WelcomeView.images
                        .padding(150)
                    getStartedButton
                    Spacer()
                    historyButton
                        .sheet(isPresented: $showHistory) {
                            HistoryView(showHistory: $showHistory)
                        }
                }
                
                .frame(height: geometry.size.height * 0.7)
            }
        }
    }
    
    var getStartedButton: some View {
        RaisedButton(buttonText: LocalizedStringProvider.Button.getStarted) {
            selectedTabManager.selectedTabZero()
        }
        .frame(width: 250, height: 50, alignment: .center)
        .padding(40)
    }
    
    var historyButton: some View {
        Button(action: {
            showHistory.toggle()
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
