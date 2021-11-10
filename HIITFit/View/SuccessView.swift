import SwiftUI

struct SuccessView: View {
    var body: some View {
        HStack {
            Image(systemName: "person.3.fill")
                .resizedToFill(width: 180, height: 110)
                .foregroundColor(.purple)
            VStack(alignment: .leading) {
                Image(systemName: "hand.raised.fill")
                    .resizedToFill(width: 0, height: 85)
                    .foregroundColor(.red)
                    .padding(130)
                    .rotation3DEffect(Angle(degrees: 300), axis: (x: 35.0, y: 65.0, z: 25.0))
                Text("Sieg he!l")
                    .font(.custom("Heil", size: 50))
                Text("Sie haben gut gemacht!")
                    .foregroundColor(.gray)
            }

            Image(systemName: "person.wave.2.fill")
                .resizedToFill(width: 0, height: 140)
                .foregroundColor(.red)
        }
    }
}


struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
    }
}
