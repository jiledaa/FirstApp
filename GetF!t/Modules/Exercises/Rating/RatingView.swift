import SwiftUI

struct RatingView: View {
    @StateObject var ratingViewModel = RatingViewModel()
//    @AppStorage(StringProvider.ratingsString) private var ratings = ""

    let index: Int
    let onColor = ColorProvider.ratings
    let offColor = Color.gray

    var body: some View {
        VStack {
            HStack {
                forEach
            }
            .font(.largeTitle)
            HStack {
                ImageProvider.battery100
                    .foregroundColor(.green)
                    .font(.title)
                    .padding(.trailing, 15)
                ImageProvider.battery50
                    .foregroundColor(.green)
                    .font(.title)
                    .padding(.horizontal, 15)
                ImageProvider.battery0
                    .foregroundColor(.green)
                    .font(.title)
                    .padding(.leading, 15)
            }.padding(-5)
        }
    }

    private var forEach: some View {
        ForEach(1 ..< ratingViewModel.maximumRating + 1, id: \.self) { index in
            Button(action: {
                ratingViewModel.updateRating(index: index)}) {
                ImageProvider.waveform
                    .foregroundColor(
                        ratingViewModel.ratingActive(index) ? offColor : onColor)
                    .font(.title3)
            }
            .buttonStyle(EmbossedButtonStyle(buttonShape: .round))
        }
    }
}


struct RatingView_Previews: PreviewProvider {
//    @AppStorage(StringProvider.ratingsString) static var ratings: String?
    static var previews: some View {
//       ratingViewModel.rating = nil
        return RatingView(index: 0)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
