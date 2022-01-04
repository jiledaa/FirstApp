import SwiftUI

struct SuccessView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    ImageProvider.person3Fill
                        .resizedToFill(width: 180, height: 110, ratio: 1)
                        .foregroundColor(.purple)
                    ImageProvider.handRaised
                        .resizedToFill(width: 0, height: 75, ratio: 1)
                        .foregroundColor(.red)
                        .padding(115)
                        .rotation3DEffect(Angle(degrees: 270), axis: (x: 20.0, y: 40.0, z: 40.0))
                    ImageProvider.personWave2Fill
                        .resizedToFill(width: 0, height: 140, ratio: 1)
                        .foregroundColor(.red)
                        .padding()
                        .rotation3DEffect(Angle(degrees: 180), axis: (x: 0, y: 1, z: 0))
                }
                
                Text(LocalizedStringProvider.SuccesPage.glory)
                    .font(.title)
                Text(LocalizedStringProvider.SuccesPage.gloryPostScript)
                    .font(.title2)
                    .foregroundColor(.gray)
            }

            VStack {
                HeaderView()
                Spacer()
                RaisedButton(buttonText: LocalizedStringProvider.Button.continue) {
                    appState.goToWelcomeView()
                    presentationMode.wrappedValue.dismiss()
                }
                .font(.largeTitle)
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
