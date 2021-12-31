import SwiftUI

struct ContentView: View {
    @StateObject var selectedTabManager = SelectedTabManager()

    var body: some View {
        ZStack(alignment: .top) {
            GradientBackground()
            HeaderView()
            TabView(selection: $selectedTabManager.selectedTab) {
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
        .environmentObject(selectedTabManager)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
