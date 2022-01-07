import SwiftUI

struct SuccessView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
            HStack(alignment: .center, spacing: geometry.size.width * 0.2) {
                ImageProvider.person3Fill
                    .resizedToFill(width: geometry.size.width * 0.15, height: geometry.size.width * 0.15, ratio: 1)
                    .foregroundColor(.purple)
                    .padding(.trailing)
                HStack(spacing: geometry.size.width * 0.03) {
                    ImageProvider.handRaised
                        .resizedToFill(width: 0, height: geometry.size.height * 0.09, ratio: 1)
                        .foregroundColor(.red)
                        .padding()
                    .rotation3DEffect(Angle(degrees: 270), axis: (x: 20.0, y: 40.0, z: 40.0))
                ImageProvider.personWave2Fill
                    .resizedToFill(width: geometry.size.width * 0.15, height: geometry.size.width * 0.15, ratio: 1)
                    .foregroundColor(.red)
                    .padding()
                    .rotation3DEffect(Angle(degrees: 180), axis: (x: 0, y: 1, z: 0))
                }
            }
            .padding(.top, geometry.size.height * 0.5)
            .padding(.leading, geometry.size.width * 0.2)
            }
            Text(LocalizedStringProvider.SuccesPage.glory)
                .font(.title)
            Text(LocalizedStringProvider.SuccesPage.gloryPostScript)
                .font(.title2)
                .foregroundColor(.gray)
                .padding(.bottom)
            RaisedButtonView(buttonText: LocalizedStringProvider.Button.continue) {
                navigationManager.goToWelcomeView()
                presentationMode.wrappedValue.dismiss()
            }
            .font(.largeTitle)
            .padding()
        }

    }
}


struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
            .environmentObject(NavigationManager())
    }
}
