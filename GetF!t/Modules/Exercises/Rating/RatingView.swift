import SwiftUI

struct RatingView: View {
    @ObservedObject var ratingViewModel: RatingViewModel
    let exerciseIndex: Int
    @AppStorage(LocalizedStringProvider.ratingsString) private var ratings = ""
    @State private var rating = 0
    let maximumRating = 5
    let onColor = Color(LocalizedStringProvider.ratingsString)
    let offColor = Color.gray
    
    var body: some View {
        VStack {
            HStack {
                ratingViewModel.forEach()
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
      return RatingView(ratingViewModel: RatingViewModel.init(exerciseIndex: 0), exerciseIndex: 0)
      .preferredColorScheme(.dark)
      .previewLayout(.sizeThatFits)
  }
}
