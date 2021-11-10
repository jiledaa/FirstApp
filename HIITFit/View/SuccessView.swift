import SwiftUI

struct SuccessView: View {
    var body: some View {
        ZStack {
            HStack {
                Image(systemName: "person.3.fill")
                    .resizedToFill(width: 180, height: 110)
                    .foregroundColor(.purple)
                VStack(alignment: .leading) {
                    Image(systemName: "hand.raised.fill")
                        .resizedToFill(width: 0, height: 85)
                        .foregroundColor(.red)
                        .padding(130)
                        .rotation3DEffect(Angle(degrees: 300), axis: (x: 35.0, y: 55.0, z: 25.0))
                    Text("Sieg he!l")
                        .font(.custom("Heil", size: 50))
                    Text("""
    Sie haben gut gemacht!
    Und jetzt lass unseren\
    Nazi stopfen!
    """)
                        .foregroundColor(.gray)
                }

                Image(systemName: "person.wave.2.fill")
                    .resizedToFill(width: 0, height: 140)
                    .foregroundColor(.red)
            }
            VStack {
                HeaderView(titleText: "Der Erfolg!")
                Spacer()
                Button(action: { }) {
                  Text("fortsenzen")
                  Image(systemName: "arrow.right.circle")
                }
                .font(.custom("Get started", size: 28))
                .padding(90)
            }
        }
    }
}


struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
    }
}
