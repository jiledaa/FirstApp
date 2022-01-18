import SwiftUI

struct ContentView: View {
    @StateObject var navigationManager = NavigationManager()
    @EnvironmentObject var historyViewModel: HistoryViewModel
    @StateObject var exerciseManagerProvider = ExerciseManagerProvider(managers: Exercise.allCases.map(ExerciseManager.init))
    @StateObject var settingsManager = SettingsManager()
    
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
                .padding(.top, -5)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .sheet(item: $navigationManager.modal, content: ModalView.init)
                
                HStack {
                    historyButton
                    Spacer()
                    settingsButton
                }
                .padding(.horizontal)
                .padding(.top, 5)
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
            historyViewModel.saveHistory()
            settingsManager.saveExerciseOrder()
        }
        .environmentObject(settingsManager)
        .environmentObject(navigationManager)
    }

    var historyButton: some View {
        Button(action: {
            navigationManager.onShowHistoryTapped()
        }) {
            ImageProvider.calendar
                .frame(width: 60, height: 20)
        }
        .buttonStyle(EmbossedButtonStyle())
    }

    var settingsButton: some View {
        Button(action: {
            navigationManager.onShowSettingsTapped()
        }) {
            ImageProvider.settings
                .frame(width: 60, height: 20)
        }
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
