import SwiftUI

struct ContentView: View {
    @StateObject var navigationManager = NavigationManager()
    @StateObject var appState = AppState()
    @EnvironmentObject var history: HistoryViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            GradientBackground()
            VStack {
                HeaderView()
                TabView(selection: $appState.selectedTab) {
                    WelcomeView()
                        .tag(-1)
                    ForEach(0 ..< Exercise.exercises.count) { index in
                        // TODO: predelat ViewModel
                        ExerciseView(exerciseViewModel: .init(index: index))
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .sheet(item: $navigationManager.modal, content: ModalView.init)
                historyButton
                    .sheet(isPresented: $appState.showHistory) {
                        HistoryView()
                    }
            }
        }
        .environmentObject(navigationManager)
        .onAppear {
            appState.addDoneExercise = history.addDoneExercise
        }
    }

    @ViewBuilder
    var switchLogic: some View {
        if let exerciseSheet = appState.sheetType {
            switch exerciseSheet {
            case .history:
                HistoryView()
            case .timer:
                TimerView()
            case .success:
                SuccessView()
            }
        }
    }

    var historyButton: some View {
        Button(action: {
            appState.showHistoryToggle
        }) {
            Text(LocalizedStringProvider.Button.history)
                .fontWeight(.bold)
                .padding([.leading, .trailing], 5)
        }

        .padding(.bottom)
        .buttonStyle(EmbossedButton())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
