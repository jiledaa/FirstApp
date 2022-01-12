import SwiftUI

extension WelcomeView {
    static var width: CGFloat = 40
    static var height: CGFloat = 40

    static var images: some View {
        ZStack {
            ImageProvider.exercise
                .resizedToFill(width: width, height: height, ratio: 1.2)
                .clipShape(Circle())
                .position(x: 50, y: 60)
            ImageProvider.head
                .resizedToFill(width: width, height: height, ratio: 2)
                .clipShape(Circle())
                .position(x: 130, y: 70)
            ImageProvider.arm
                .resizedToFill(width: width, height: height, ratio: 2.7)
                .clipShape(Circle())
                .position(x: 230, y: 110)
            ImageProvider.hands
                .resizedToFill(width: width, height: height, ratio: 3.3)
                .clipShape(Circle())
                .position(x: 290, y: 220)
            ImageProvider.stepUp
                .resizedToFill(width: width, height: height, ratio: 4.4)
                .clipShape(Circle())
                .position(x: 110, y: 220)
            Text(LocalizedStringProvider.WelcomePage.getfit)
                .font(.title)
                .fontWeight(.black)
                .kerning(3)
                .position(x: 100, y: 350)
            Text(LocalizedStringProvider.WelcomePage.getfitPostScript)
                .font(.headline)
                .fontWeight(.medium)
                .kerning(2)
                .position(x: 150, y: 390)
                .multilineTextAlignment(.leading)
        }
        .frame(maxWidth: .infinity)
    }
}
struct WelcomeImages_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            WelcomeView.images
        }
    }
}
