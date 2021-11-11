import SwiftUI

struct RatingView: View {
    var body: some View {
        HStack {
            Image(systemName: "battery.100")
                .foregroundColor(.green)
                .font(.system(size: 50))
            Image(systemName: "waveform.path.ecg")
                .foregroundColor(.red)
                .font(.system(size: 50))
            Image(systemName: "battery.50")
                .foregroundColor(.green)
                .font(.system(size: 50))
            Image(systemName: "waveform.path.ecg")
                .foregroundColor(.red)
                .font(.system(size: 50))
            Image(systemName: "battery.0")
                .foregroundColor(.green)
                .font(.system(size: 50))
            }
        }
    }


struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView()
            .previewLayout(/*@START_MENU_TOKEN@*/.sizeThatFits/*@END_MENU_TOKEN@*/)
    }
}
