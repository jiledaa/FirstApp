import SwiftUI

struct ContentView: View {
    @StateObject var navigationManager = NavigationManager()

    var body: some View {
        ZStack(alignment: .top) {
            GradientBackground()
            HeaderView()
            TabView(selection: $navigationManager.selectedTab) {
                WelcomeView()
                    .tag(-1)
                ForEach(0 ..< Exercise.exercises.count) { index in
                    // this is okay now, we don't store anything in the view model
                    // so there is no problem with it beeing recomputed every time
                    ExerciseView(exerciseViewModel: .init(index: index))
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .sheet(item: $navigationManager.modal, content: Modal.init)
        }
        .environmentObject(navigationManager)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
