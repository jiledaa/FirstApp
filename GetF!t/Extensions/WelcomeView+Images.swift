import SwiftUI

extension WelcomeView {
    static var width: CGFloat = 40
    static var height: CGFloat = 40

    static var images: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .top) {
                ImageProvider.exercise
                    .resizedToFill(width: width, height: height, ratio: 1.2)
                    .clipShape(Circle())
                    .offset(x: -50, y: -80)
                ImageProvider.head
                    .resizedToFill(width: width, height: height, ratio: 2)
                    .clipShape(Circle())
                    .offset(x: 38, y: -80)
                ImageProvider.arm
                    .resizedToFill(width: width, height: height, ratio: 3)
                    .clipShape(Circle())
                    .offset(x: 155, y: -35)
                ImageProvider.hands
                    .resizedToFill(width: width, height: height, ratio: 4)
                    .clipShape(Circle())
                    .offset(x: 205, y: 80)
                ImageProvider.stepUp
                    .resizedToFill(width: width, height: height, ratio: 5)
                    .clipShape(Circle())
                    .offset(x: 5)
            }
            VStack(alignment: .leading) {
                Text(LocalizedStringProvider.WelcomePage.getfit)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .kerning(3)
                Text(LocalizedStringProvider.WelcomePage.getfitPostScript)
                    .font(.headline)
                    .fontWeight(.medium)
                    .kerning(2)
            }
            .padding(.leading)
        }
        .frame(maxWidth: .infinity)
        .padding(.trailing)
    }
}

struct WelcomeImages_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            WelcomeView.images
        }
    }
}
