import SwiftUI

struct SuccessView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack {
            VStack {
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

                Text(NSLocalizedString("Glory to the victory!", comment: "glory"))
                    .font(.custom("Heil", size: 30))
                Text(NSLocalizedString("Well done! And now cram your nazi.", comment: "food"))
                    .font(.custom("food", size: 20))
                    .foregroundColor(.gray)
            }

            VStack {
                HeaderView(selectedTab: .constant(0), titleText: NSLocalizedString("Success!", comment: "praise"))
                Spacer()
                Button(action: {
                    selectedTab = 9
                    presentationMode.wrappedValue.dismiss()
                }) {
                  Text(NSLocalizedString("Continue", comment: "continue"))
                  Image(systemName: "arrow.right.circle")
                }
                .font(.custom("continue", size: 35))
                .padding(90)
            }
        }
    }
}


struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView(selectedTab: .constant(3))
    }
}
