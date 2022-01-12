import SwiftUI

struct ContentView: View {
    @StateObject var navigationManager = NavigationManager()
    @EnvironmentObject var historyViewModel: HistoryViewModel
    @StateObject var exerciseManagerProvider = ExerciseManagerProvider(managers: Exercise.exercises.map(ExerciseManager.init))

    var body: some View {
        ZStack {
            GradientBackground()
            VStack {
                HeaderView()
                TabView(selection: $navigationManager.selectedTab) {
                    WelcomeView()
                        .tag(-1)
                    ForEach(Array(exerciseManagerProvider.managers.enumerated()), id:\.offset) { index, manager in
                        ExerciseView(exerciseManager: manager)
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
                historyViewModel.saveHistory()
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
