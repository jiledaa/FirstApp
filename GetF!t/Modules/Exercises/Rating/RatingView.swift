import SwiftUI

struct RatingView: View {
    @StateObject var ratingViewModel = RatingViewModel()
//    @AppStorage(StringProvider.ratingsString) private var ratings = ""

    let onColor = ColorProvider.ratings
    let offColor = Color.gray
    let exerciseIndex: Int
    var body: some View {
        VStack {
            HStack {
                rating
            }
            .font(.largeTitle)
            .padding(.vertical, 40)
        }
        .onAppear {
            ratingViewModel.loadRating(exerciseIndex: exerciseIndex)
        }
    }

    private var rating: some View {
        ForEach(1 ..< ratingViewModel.maximumRating + 1, id: \.self) { index in
            Button(action: {
                ratingViewModel.updateRating(index: index, exerciseIndex: exerciseIndex)
            }) {
                ImageProvider.waveform
                    .foregroundColor(
                        ratingViewModel.ratingActive(index) ? offColor : onColor)
                    .font(.title3)
            }
            .buttonStyle(EmbossedButton(buttonShape: .round))
        }
    }
}


struct RatingView_Previews: PreviewProvider {
//    @AppStorage(StringProvider.ratingsString) static var ratings: String?
    static var previews: some View {
//       ratingViewModel.rating = nil
        return RatingView(exerciseIndex: 0)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
