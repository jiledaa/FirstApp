import SwiftUI

struct RatingView: View {
    @ObservedObject var ratingViewModel: RatingViewModel
    @AppStorage(StringProvider.ratingsString) private var ratings = ""

    let onColor = Color(StringProvider.ratingsString)
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
            Button(action: {ratingViewModel.updateRating(index: index)}) {
                ImageProvider.waveform
                    .foregroundColor(
                        ratingViewModel.ratingActive(index) ? offColor : onColor)
                    .font(.title3)
            }
            .buttonStyle(EmbossedButtonStyle(buttonShape: .round))
            .onChange(of: self.ratings) { _ in
                ratingViewModel.convertRating()
            }
            .onAppear {
                ratingViewModel.convertRating()
            }
        }
    }

}


struct RatingView_Previews: PreviewProvider {
    @AppStorage(StringProvider.ratingsString) static var ratings: String?
    static var previews: some View {
        ratings = nil
        return RatingView(ratingViewModel: RatingViewModel.init(exerciseIndex: 0))
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
