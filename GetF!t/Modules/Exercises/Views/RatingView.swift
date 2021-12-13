import SwiftUI

struct RatingView: View {
    let exerciseIndex: Int
    @AppStorage(LocalizedStringProvider.ratingsString) private var ratings = ""
    @State private var rating = 0
    let maximumRating = 5
    let onColor = Color(LocalizedStringProvider.ratingsString)
    let offColor = Color.gray
    
    init(exerciseIndex: Int) {
        self.exerciseIndex = exerciseIndex
        let desiredLength = Exercise.exercises.count
        if ratings.count < desiredLength {
            ratings = ratings.padding(
                toLength: desiredLength,
                withPad: "0",
                startingAt: 0)
        }
    }
    
    fileprivate func convertRating() {
        let index = ratings.index(
            ratings.startIndex,
            offsetBy: exerciseIndex)
        let character = ratings[index]
        rating = character.wholeNumberValue ?? 0
    }
    
    func updateRating(index: Int) {
        rating = index
        let index = ratings.index(
            ratings.startIndex,
            offsetBy: exerciseIndex)
        ratings.replaceSubrange(index...index, with: String(rating))
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(1 ..< maximumRating + 1) { index in
                    Button(action: {
                        updateRating(index: index)
                    }, label: {
                        Image(systemName: ImageProvider.waveform)
                            .foregroundColor(
                                index > rating ? offColor : onColor)
                            .font(.title3)
                    })
                        .buttonStyle(EmbossedButtonStyle(buttonShape: .round))
                        .onChange(of: ratings) { _ in
                            convertRating()
                        }
                        .onAppear {
                            convertRating()
                        }
                }
            }
            .font(.largeTitle)
            
            HStack {
                Image(systemName: ImageProvider.battery100)
                    .foregroundColor(.green)
                    .font(.title)
                    .padding(.trailing, 15)
                Image(systemName: ImageProvider.battery50)
                    .foregroundColor(.green)
                    .font(.title)
                    .padding(.horizontal, 15)
                Image(systemName: ImageProvider.battery0)
                    .foregroundColor(.green)
                    .font(.title)
                    .padding(.leading, 15)
            }.padding(-5)
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    @AppStorage(LocalizedStringProvider.ratingsString) static var ratings: String?
  static var previews: some View {
    ratings = nil
    return RatingView(exerciseIndex: 0)
      .preferredColorScheme(.dark)
      .previewLayout(.sizeThatFits)
  }
}
