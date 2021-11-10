import SwiftUI
import AVKit

struct ExerciseView: View {
    let index: Int
    let interval: TimeInterval = 30

    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(titleText: Exercise.exercises[index].exerciseName)
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
                    .font(.system(size: 90))
                Button(NSLocalizedString("Start/done", comment: "StartButton")) { }
                .font(.custom("StartStop", size: 30))
                  .padding()
                RatingView()
                    .padding()
                Button(NSLocalizedString("History", comment: "History")) { }
                  .padding(.bottom)
            }
        }
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(index: 0)
    }
}


