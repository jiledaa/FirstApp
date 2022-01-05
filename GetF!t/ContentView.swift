import SwiftUI

struct ContentView: View {
    @StateObject var navigationManager = NavigationManager()
    @EnvironmentObject var history: HistoryViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            GradientBackground()
            VStack {
                HeaderView()
                TabView(selection: $navigationManager.selectedTab) {
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
                    .sheet(isPresented: $navigationManager.showHistory) {
                        HistoryView()
                    }
            }
        }
        .environmentObject(navigationManager)
        .onAppear {
            navigationManager.addDoneExercise = history.addDoneExercise
        }
    }

    var historyButton: some View {
        Button(action: {
            navigationManager.showHistoryToggle
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
