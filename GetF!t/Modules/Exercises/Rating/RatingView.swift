import SwiftUI

struct RatingView: View {
    @ObservedObject var ratingViewModel: RatingViewModel

    let onColor = ColorProvider.ratings
    let offColor = Color.gray
    var body: some View {
        VStack {
            HStack {
                rating
            }
            .font(.largeTitle)
            .padding(.vertical, 40)
        }
    }

    private var rating: some View {
        ForEach(1 ..< ratingViewModel.maximumRating + 1, id: \.self) { index in
            Button(action: {
                ratingViewModel.updateRating(index: index)
            }) {
                ImageProvider.waveform
                    .foregroundColor(
                        ratingViewModel.ratingActive(index) ? offColor : onColor)
                    .font(.title3)
            }
            .buttonStyle(EmbossedButtonView(buttonShape: .round))
        }
    }
}


struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        return RatingView(ratingViewModel: .init())
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
