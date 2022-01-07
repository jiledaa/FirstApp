import SwiftUI
import AVKit

struct ExerciseView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @StateObject var ratingViewModel = RatingViewModel()

    let exerciseViewModel: ExercisesViewModel

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                ContainerView {
                    VStack {
                        video(size: geometry.size)
                        Spacer()
                        startExerciseButton
                        RatingView(ratingViewModel: ratingViewModel)
                    }
                }
                .frame(height: geometry.size.height * 1)
            }
        }
        .onAppear{
            ratingViewModel.loadRating(exercise: exerciseViewModel.exercise)
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
        RaisedButtonView(buttonText: LocalizedStringProvider.Button.startExercise) {
            navigationManager.onStartExerciseTapped()
        }
        .frame(width: 250, height: 50, alignment: .center)
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(exerciseViewModel: .init(exercise: .init(exerciseName: LocalizedStringProvider.ExercisesNames.squat, videoName: StringProvider.ExercisesNamesVideo.squat)))
            .environmentObject(HistoryViewModel())
    }
}
