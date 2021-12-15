import SwiftUI
import AVKit

struct ExerciseView: View {
    @EnvironmentObject var history: HistoryViewModel
    @Binding var selectedTab: Int
    @State private var timerDone = false

    @State private var showSuccess = false
    @State private var showSheet = false
    @State private var showHistory = false
    @State private var showTimer = false

    @State private var exerciseSheet: ExerciseSheet?

    let index: Int

    enum ExerciseSheet {
        case history, timer, success
    }

    let exercisesCount = Exercise.exercises.count
    var lastExercise: Bool {
        index + 1 == exercisesCount
    }

    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(
                    selectedTab: $selectedTab,
                    titleText: Exercise.exercises[index].exerciseName)
                    .padding(.bottom)
                Spacer()
                ContainerView {
                    VStack {
                        video(size: geometry.size)
                        startExerciseButton
                            .frame(width: 250, height: 50, alignment: .center)
                            .padding(100)
                        Spacer()
                        RatingView(ratingViewModel: RatingViewModel.init(exerciseIndex: index), exerciseIndex: index)
                            .padding()
                        historyButton
                    }
                }
                .frame(height: geometry.size.height * 0.8)
                .sheet(isPresented: $showSheet, onDismiss: {
                    showSuccess = false
                    showHistory = false
                    if exerciseSheet == .timer {
                        if timerDone, index <= exercisesCount {
                            history.addDoneExercise(Exercise.exercises[index].exerciseName)
                            timerDone = false
                        }
                        showTimer = false
                        if lastExercise {
                            showSuccess = true
                            showSheet = true
                            exerciseSheet = .success
                        } else {
                            selectedTab += 1
                        }
                    } else {
                        exerciseSheet = nil
                    }
                    showTimer = false
                }, content: {
                    if let exerciseSheet = exerciseSheet, index <= exercisesCount {
                        switch exerciseSheet {
                        case .history:
                            HistoryView(showHistory: $showHistory)
                                .environmentObject(history)
                        case .timer:
                            TimerView(timerViewModel: TimerViewModel.init(exerciseName: Exercise.exercises[index].exerciseName))


                        case .success:
                            SuccessView(selectedTab: $selectedTab)
                        }
                    }
                })
            }
        }
    }

    @ViewBuilder
    func video(size: CGSize) -> some View {
        if index <= exercisesCount {
            if let url = Bundle.main.url(
                forResource: Exercise.exercises[index].videoName,
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

    var startExerciseButton: some View {
        RaisedButton(buttonText: LocalizedStringProvider.Button.startExercise) {
            showTimer.toggle()
            showSheet = true
            exerciseSheet = .timer
        }
    }

    var historyButton: some View {
        Button(action: {
            showSheet = true
            showHistory = true
            exerciseSheet = .history
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
        ExerciseView(selectedTab: .constant(0), index: 0)
            .environmentObject(HistoryViewModel())
    }
}
