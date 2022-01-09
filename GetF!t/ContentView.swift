import SwiftUI

struct ContentView: View {
    @StateObject var navigationManager = NavigationManager()
    @EnvironmentObject var historyViewModel: HistoryViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            GradientBackground()
            VStack {
                HeaderView()
                TabView(selection: $navigationManager.selectedTab) {
                    WelcomeView()
                        .tag(-1)
                    ForEach(0 ..< Exercise.exercises.count) { index in
                        ExerciseView(exerciseViewModel: .init(exercise: Exercise.exercises[index]))
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .sheet(item: $navigationManager.modal, content: ModalView.init)
                HStack {
                    historyButton
                    Spacer()
                    settingsButton
                }
                .padding(.horizontal)
                .padding(.horizontal)

            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                historyViewModel.savingHistory()
            }
        }
        .environmentObject(navigationManager)
    }

    var historyButton: some View {
        Button(action: {
            navigationManager.onShowHistoryTapped()
        }) {
            ImageProvider.calendar
                .padding(.horizontal)
        }
        .padding(.top)
        .buttonStyle(EmbossedButtonView())
    }

    var settingsButton: some View {
        Button(action: {
            navigationManager.onShowSettingsTapped()
        }) {
            ImageProvider.settings
                .padding(.horizontal)
        }
        .padding(.top)
        .buttonStyle(EmbossedButtonView())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
