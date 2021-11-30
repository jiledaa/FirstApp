


import SwiftUI
import AVKit

struct ExerciseView: View {
  @EnvironmentObject var history: HistoryStore
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

  var lastExercise: Bool {
    index + 1 == Exercise.exercises.count
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
            RatingView(exerciseIndex: index)
              .padding()
            historyButton
          }
        }
        .frame(height: geometry.size.height * 0.8)
        .sheet(isPresented: $showSheet, onDismiss: {
          showSuccess = false
          showHistory = false
          if exerciseSheet == .timer {
            if timerDone {
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
          if let exerciseSheet = exerciseSheet {
            switch exerciseSheet {
            case .history:
              HistoryView(showHistory: $showHistory)
                .environmentObject(history)
            case .timer:
              TimerView(
                timerDone: $timerDone,
                exerciseName: Exercise.exercises[index].exerciseName)
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
    if let url = Bundle.main.url(
      forResource: Exercise.exercises[index].videoName,
        withExtension: "mp4") {
      VideoPlayer(player: AVPlayer(url: url))
        .frame(height: size.height * 0.25)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(20)
    } else {
      Text(
        "Couldn't find \(Exercise.exercises[index].videoName).mp4")
        .foregroundColor(.red)
    }
  }

  var startExerciseButton: some View {
    RaisedButton(buttonText: "Start Exercise") {
      showTimer.toggle()
      showSheet = true
      exerciseSheet = .timer
    }
  }

  var historyButton: some View {
    Button(
      action: {
        showSheet = true
        showHistory = true
        exerciseSheet = .history
      }, label: {
        Text("History")
          .fontWeight(.bold)
          .padding([.leading, .trailing], 5)
      })
      .padding(.bottom, 10)
      .buttonStyle(EmbossedButtonStyle())
  }
}

struct ExerciseView_Previews: PreviewProvider {
  static var previews: some View {
    ExerciseView(selectedTab: .constant(0), index: 0)
      .environmentObject(HistoryStore())
  }
}
