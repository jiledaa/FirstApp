import SwiftUI

struct ContentView: View {
    @StateObject var appState = AppState()
    @EnvironmentObject var history: HistoryViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            GradientBackground()
            HeaderView()
            TabView(selection: $appState.selectedTab) {
                WelcomeView()
                    .tag(9)
                ForEach(0 ..< Exercise.exercises.count) { index in
                    // TODO: predelat ViewModel
                    ExerciseView(exerciseViewModel: .init(index: index))
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        .environmentObject(appState)
        .onAppear {
            appState.addDoneExercise = history.addDoneExercise
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
