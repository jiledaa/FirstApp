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
                        VideoPlayerView(
                            size: geometry.size,
                            videoURL: exerciseViewModel.videoURL,
                            errorText: LocalizedStringProvider.Errors.couldntFind
                        )
                        Spacer()
                        CustomButton(
                            text: LocalizedStringProvider.Button.startExercise,
                            action: navigationManager.onStartExerciseTapped
                        )
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
}

private struct CustomButton: View {
    let text: LocalizedStringKey
    let action: () -> Void

    var body: some View {
        RaisedButtonView(buttonText: LocalizedStringProvider.Button.startExercise, action: action)
            .frame(width: 250, height: 50, alignment: .center)
    }
}

private struct VideoPlayerView: View {
    let size: CGSize
    let videoURL: URL?
    let errorText: LocalizedStringKey

    var body: some View {
        if let url = videoURL {
            VideoPlayer(player: AVPlayer(url: url))
                .frame(height: size.height * 0.55)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(20)
        } else {
            Text(errorText)
                .foregroundColor(.red)
        }
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(exerciseViewModel: .init(exercise: .init(exerciseName: LocalizedStringProvider.ExercisesNames.squat, videoName: StringProvider.ExercisesNamesVideo.squat)))
            .environmentObject(HistoryViewModel())
    }
}
