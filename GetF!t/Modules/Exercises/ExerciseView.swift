import SwiftUI
import AVKit

struct ExerciseView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    // view model doesn't have any @Published properties so we don't need to observe it
    var exerciseViewModel: ExercisesViewModel

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                ContainerView {
                    VStack {
                        video(size: geometry.size)
                        startExerciseButton
                        Spacer()
                        RatingView(exerciseIndex: exerciseViewModel.index)
                            .padding()
                        historyButton
                    }
                }
                .frame(height: geometry.size.height * 0.8)
            }
        }
    }

    @ViewBuilder
    private func video(size: CGSize) -> some View {
        if exerciseViewModel.indexLimit {
            if let url = exerciseViewModel.videoURL {
                VideoPlayer(player: AVPlayer(url: url))
                    .frame(height: size.height * 0.25)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(20)
            } else {
                Text(LocalizedStringProvider.Errors.couldntFind)
                    .foregroundColor(.red)
            }
        }
    }

    private var startExerciseButton: some View {
        RaisedButton(buttonText: LocalizedStringProvider.Button.startExercise) {
            navigationManager.onStartExerciseTapped()
        }
        .frame(width: 250, height: 50, alignment: .center)
        .padding(100)
    }

    var historyButton: some View {
        Button(action: {
            navigationManager.onShowHistoryTapped()
        }) {
            Text(LocalizedStringProvider.Button.history)
                .fontWeight(.bold)
                .padding([.leading, .trailing], 5)
        }
        .padding(.bottom, 10)
        .buttonStyle(EmbossedButtonStyle())
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(exerciseViewModel: ExercisesViewModel.init(index: 0))
            .environmentObject(NavigationManager())
    }
}
