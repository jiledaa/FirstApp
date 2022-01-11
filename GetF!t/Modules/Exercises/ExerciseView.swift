import SwiftUI
import AVKit

struct ExerciseView: View {
    @EnvironmentObject var navigationManager: NavigationManager

    let exerciseViewModel: ExercisesViewModel

    var body: some View {
        VStack {
            Spacer()
            ContainerView {
                VStack {
                    video
                        .padding(.bottom)
                    startExerciseButton
                        .padding(.bottom, 40)
                }
            }
        }
    }

    @ViewBuilder
    private var video: some View {
        if let url = exerciseViewModel.videoURL {
            VideoPlayer(player: AVPlayer(url: url))
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
