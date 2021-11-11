import SwiftUI
import AVKit

struct ExerciseView: View {
    @State private var rating = 0
    @State private var showHistory = false
    @State private var showSuccess = false
    @Binding var selectedTab: Int
    let index: Int
    let interval: TimeInterval = 30

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
                if let url = Bundle.main.url(
                    forResource: Exercise.exercises[index].videoName,
                    withExtension: "mp4") {
                    VideoPlayer(player: AVPlayer(url: url))
                        .frame(height: geometry.size.height * 0.45)
                } else {
                    Text(NSLocalizedString("Couldn't find \(Exercise.exercises[index].videoName).mp4", comment: "message"))
                        .foregroundColor(.red)
                }
                Text(Date().addingTimeInterval(interval), style: .timer)
                    .font(.system(size: 70))
                HStack(spacing: 180) {
                    Button(NSLocalizedString("Start", comment: "StartButton")) { }
                    .font(.custom("StartStop", size: 35))
                    .padding()
                    Button(NSLocalizedString("Done", comment: "DoneButton")) { selectedTab = lastExercise ? 9 : selectedTab + 1 }
                    .font(.custom("StartStop", size: 35))
                    .padding()
                }
                RatingView(rating: $rating)
                    .padding()
                Button(NSLocalizedString("History", comment: "History")) { }
                  .padding(.bottom)
            }
        }
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(selectedTab: .constant(1), index: 1)
    }
}


