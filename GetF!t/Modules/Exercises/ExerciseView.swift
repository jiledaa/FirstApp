import SwiftUI
import AVKit

struct ExerciseView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @StateObject var ratingViewModel = RatingViewModel()
    
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
                    VStack {
                        Text(LocalizedStringProvider.texts.rating)
                            .italic()
                        HStack {
                            rating
                        }

                    }
                    .padding(.vertical)
                }
            }
        }
        .onAppear {
            ratingViewModel.loadRating(exercise: exerciseViewModel.exercise)
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

    private var rating: some View {
        ForEach(1 ..< ratingViewModel.maximumRating + 1, id: \.self) { index in
            Button(action: {
            }) {
                ImageProvider.waveform
                    .foregroundColor(
                        ratingViewModel.ratingActive(index) ? ratingViewModel.offColor :   ratingViewModel.onColor)
                    .font(.title3)
            }
            .buttonStyle(EmbossedButtonStyle(buttonShape: .round))
        }
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(exerciseViewModel: .init(exercise: .init(exerciseName: LocalizedStringProvider.ExercisesNames.squat, videoName: StringProvider.ExercisesNamesVideo.squat)))
            .environmentObject(HistoryViewModel())
    }
}
