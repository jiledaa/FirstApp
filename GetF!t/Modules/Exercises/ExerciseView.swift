import SwiftUI
import AVKit

struct ExerciseView: View {
    @ObservedObject var exerciseViewModel: ExercisesViewModel
<<<<<<< HEAD
    @EnvironmentObject var history: HistoryViewModel
    @EnvironmentObject var selectedTabManager: SelectedTabManager
=======

>>>>>>> 109878553be7fce11fb4b432305cb7f10f12ed9f
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(headerViewModel: HeaderViewModel.init(), titleText: exerciseViewModel.exercise)
                    .padding(.bottom)
                Spacer()
                ContainerView {
                    VStack {
                        video(size: geometry.size)
                        startExerciseButton
                        Spacer()
                        RatingView(ratingViewModel: RatingViewModel.init(exerciseIndex: exerciseViewModel.index))
                            .padding()
                        historyButton
                    }
                }
                .frame(height: geometry.size.height * 0.8)
                .sheet(isPresented: $exerciseViewModel.showSheet, onDismiss: {
                    exerciseViewModel.onDismissLogic
                }) {
                    switchLogic()
                }
            }
        }
    }

    @ViewBuilder
    func switchLogic() -> some View {
        if let exerciseSheet = exerciseViewModel.exerciseSheet, exerciseViewModel.indexLimit {
            switch exerciseSheet {
            case .history:
<<<<<<< HEAD
                HistoryView()
=======
                HistoryView(showHistory: $exerciseViewModel.showHistory)
>>>>>>> 109878553be7fce11fb4b432305cb7f10f12ed9f
            case .timer:
                TimerView()
            case .success:
                SuccessView()
            }
        }
    }

    @ViewBuilder
    private func video(size: CGSize) -> some View {
        if exerciseViewModel.indexLimit {
            if let url = Bundle.main.url(
                forResource: exerciseViewModel.video,
                withExtension: "mp4") {
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
            exerciseViewModel.startExerciseButtonTapped
        }
        .frame(width: 250, height: 50, alignment: .center)
        .padding(100)
    }

    var historyButton: some View {
        Button(action: {
            exerciseViewModel.historyButtonTapped
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
            .environmentObject(HistoryViewModel())
    }
}
