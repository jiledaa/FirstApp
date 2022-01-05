import SwiftUI
import AVKit

struct ExerciseView: View {
    @EnvironmentObject var navigationManager: NavigationManager

    var exerciseViewModel: ExercisesViewModel

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                ContainerView {
                    VStack {
                        video(size: geometry.size)
                        Spacer()
                        startExerciseButton
                        RatingView(exerciseIndex: exerciseViewModel.index)
                    }
                }
                .frame(height: geometry.size.height * 1)
            }
        }
    }

    @ViewBuilder
    private func video(size: CGSize) -> some View {
        if let url = exerciseViewModel.videoURL {
            VideoPlayer(player: AVPlayer(url: url))
                .frame(height: size.height * 0.55)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(20)
        } else {
            Text(LocalizedStringProvider.Errors.couldntFind)
                .foregroundColor(.red)
        }
    }

    private var startExerciseButton: some View {
        RaisedButton(buttonText: LocalizedStringProvider.Button.startExercise) {
            navigationManager.onStartExerciseTapped()
        }
        .frame(width: 250, height: 50, alignment: .center)
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
        .buttonStyle(EmbossedButton())
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(exerciseViewModel: ExercisesViewModel.init(index: 0))
            .environmentObject(HistoryViewModel())
    }
}
