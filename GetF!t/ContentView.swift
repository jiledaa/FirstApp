import SwiftUI

struct ContentView: View {
    @StateObject var navigationManager = NavigationManager()
    @EnvironmentObject var historyViewModel: HistoryViewModel
    
    var body: some View {
        ZStack {
            GradientBackground()
            VStack {
                HeaderView()
                TabView(selection: $navigationManager.selectedTab) {
                    WelcomeView()
                        .tag(-1)
                    ForEach(0 ..< Exercise.exercises.count) { index in
                        ExerciseView(exercise: Exercise.exercises[index])
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .sheet(item: $navigationManager.modal, content: ModalView.init)
                historyButton
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                historyViewModel.saveHistory()
            }
        }
        .environmentObject(navigationManager)
    }

    var historyButton: some View {
        Button(action: {
            navigationManager.onShowHistoryTapped()
        }) {
            Text(LocalizedStringProvider.Button.history)
                .fontWeight(.bold)
                .padding([.leading, .trailing], 5)
        }
        .padding(.top, 5)
        .buttonStyle(EmbossedButtonStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
