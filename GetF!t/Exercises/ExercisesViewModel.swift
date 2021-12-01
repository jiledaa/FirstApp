import Foundation
import SwiftUI
import AVKit

struct ExerciseModelView {

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
