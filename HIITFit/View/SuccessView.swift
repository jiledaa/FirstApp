import SwiftUI

struct SuccessView: View {
    var body: some View {
        ZStack {
            HStack {
                Image(systemName: "person.3.fill")
                    .resizedToFill(width: 180, height: 110)
                    .foregroundColor(.purple)
                Image(systemName: "hand.raised.fill")
                    .resizedToFill(width: 0, height: 75)
                    .foregroundColor(.red)
                    .padding(115)
                    .rotation3DEffect(Angle(degrees: 270), axis: (x: 20.0, y: 40.0, z: 40.0))
                Image(systemName: "person.wave.2.fill")
                    .resizedToFill(width: 0, height: 140)
                    .foregroundColor(.red)
                    .padding()
                    .rotation3DEffect(Angle(degrees: 180), axis: (x: 0, y: 1, z: 0))
            }

            VStack {
                HeaderView(selectedTab: .constant(0), titleText: NSLocalizedString("Success!", comment: "praise"))
                Spacer()
                Button(action: { }) {
                  Text(NSLocalizedString("Continue", comment: "continue"))
                  Image(systemName: "arrow.right.circle")
                }
                .font(.custom("continue", size: 35))
                .padding(90)
                Text(NSLocalizedString("Glory to the victory!", comment: "glory"))
                    .font(.custom("Heil", size: 30))
                Text(NSLocalizedString("Well done! And now cram your nazi.", comment: "food"))
                    .foregroundColor(.gray)
            }
        }
    }
}


struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
    }
}
