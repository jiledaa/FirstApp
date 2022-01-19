import SwiftUI

extension WelcomeView {
    static var width: CGFloat = 40
    static var height: CGFloat = 40

    static var images: some View {
        ZStack(alignment: .center) {
            ImageProvider.exercise
                .resizedToFill(width: width, height: height, ratio: 1.2)
                .clipShape(Circle())
                .offset(x: -130, y: -195)
            ImageProvider.head
                .resizedToFill(width: width, height: height, ratio: 2)
                .clipShape(Circle())
                .offset(x: -50, y: -180)
            ImageProvider.arm
                .resizedToFill(width: width, height: height, ratio: 2.7)
                .clipShape(Circle())
                .offset(x: 50, y: -130)
            ImageProvider.hands
                .resizedToFill(width: width, height: height, ratio: 3.3)
                .clipShape(Circle())
                .offset(x: 105, y: -10)
            ImageProvider.stepUp
                .resizedToFill(width: width, height: height, ratio: 4.4)
                .clipShape(Circle())
                .offset(x: -75, y: -10)
            Text(LocalizedStringProvider.WelcomePage.getfit)
                .font(.title)
                .fontWeight(.black)
                .kerning(3)
                .offset(x: 50, y: 80)
            Text(LocalizedStringProvider.WelcomePage.getfitPostScript)
                .font(.headline)
                .fontWeight(.medium)
                .kerning(2)
                .offset(x: 50, y: 120)
                .multilineTextAlignment(.leading)
        }
    }
}

struct WelcomeImages_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            WelcomeView.images
        }
    }
}
