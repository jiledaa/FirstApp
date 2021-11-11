import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    let maximumRating = 5

    let onColor = Color.red
    let offColor = Color.gray

    var body: some View {
        ZStack {
            VStack {
                HStack {
                  ForEach(1 ..< maximumRating + 1) { index in
                    Image(systemName: "waveform.path.ecg")
                      .foregroundColor(
                        index > rating ? offColor : onColor)
                      .onTapGesture {
                        rating = index
                      }
                  }
                  .font(.custom("rating", size: 42))
                }

                HStack {
                Image(systemName: "battery.100")
                    .foregroundColor(.green)
                    .font(.system(size: 45))
                    .padding(10)
                Image(systemName: "battery.50")
                    .foregroundColor(.green)
                    .font(.system(size: 45))
                    .padding(10)
                Image(systemName: "battery.0")
                    .foregroundColor(.green)
                    .font(.system(size: 45))
                    .padding(10)
                }
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
  static var previews: some View {
    RatingView(rating: .constant(3))
      .previewLayout(.sizeThatFits)
  }
}

