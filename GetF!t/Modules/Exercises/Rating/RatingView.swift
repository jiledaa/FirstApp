import SwiftUI

struct RatingView: View {
    @ObservedObject var ratingViewModel: RatingViewModel
    let exerciseIndex: Int
    @AppStorage(StringProvider.ratingsString) private var ratings = ""
    @State private var rating = 0
    let maximumRating = 5
    let onColor = Color(StringProvider.ratingsString)
    let offColor = Color.gray
    
    var body: some View {
        VStack {
            HStack {
                ratingViewModel.forEach()
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
}

struct RatingView_Previews: PreviewProvider {
    @AppStorage(StringProvider.ratingsString) static var ratings: String?
    static var previews: some View {
        ratings = nil
        return RatingView(ratingViewModel: RatingViewModel.init(exerciseIndex: 0), exerciseIndex: 0)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
