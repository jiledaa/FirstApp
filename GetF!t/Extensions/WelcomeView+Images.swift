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
                    .offset(x: -100, y: -100)
                ImageProvider.head
                    .resizedToFill(width: width, height: height, ratio: 2)
                    .clipShape(Circle())
                    .offset(x: -12, y: -100)
                ImageProvider.arm
                    .resizedToFill(width: width, height: height, ratio: 2.7)
                    .clipShape(Circle())
                    .offset(x: 90, y: -60)
                ImageProvider.hands
                    .resizedToFill(width: width, height: height, ratio: 3.3)
                    .clipShape(Circle())
                    .offset(x: 135, y: 60)
                ImageProvider.stepUp
                    .resizedToFill(width: width, height: height, ratio: 4)
                    .clipShape(Circle())
                    .offset(x: -45, y: 30)
            }
            .padding([.leading, .bottom, .trailing])
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
            .padding()
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
