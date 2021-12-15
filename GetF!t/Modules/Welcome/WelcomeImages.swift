import SwiftUI

import SwiftUI

extension WelcomeView {
    static var images: some View {
        ZStack {
            ImageProvider.exercise
                .resizedToFill(width: 40, height: 40)
                .clipShape(Circle())
                .offset(x: -230, y: -200)
                .shadow(color: .black, radius: 3, x: -10, y: -6)
            Image(ImageProvider.head)
                .resizedToFill(width: 60, height: 60)
                .clipShape(Circle())
                .offset(x: -150, y: -170)
                .shadow(color: .black, radius: 8, x: -15, y: -10)
            Image(ImageProvider.arm)
                .resizedToFill(width: 80, height: 80)
                .clipShape(Circle())
                .offset(x: -60, y: -110)
                .shadow(color: .black, radius: 13, x: -23, y: -17)
            Image(ImageProvider.hands)
                .resizedToFill(width: 130, height: 130)
                .clipShape(Circle())
                .offset(x:40, y: -25)
                .shadow(color: .black, radius: 23, x: -30, y: -22)
            Image(ImageProvider.stepUp)
                .resizedToFill(width: 190, height: 190)
                .clipShape(Circle())
                .offset(x: 160, y: 130)
                .shadow(color: .black, radius: 30, x: -35, y: -35)
            Text(LocalizedStringProvider.WelcomePage.getfit)
                .font(.largeTitle)
                .fontWeight(.black)
                .kerning(3)
                .shadow(color: .black, radius: 2, x: -80, y: -25)
                .offset(x: -110, y: 200)
            Text(LocalizedStringProvider.WelcomePage.getfitPostScript)
                .font(.headline)
                .fontWeight(.medium)
                .kerning(2)
                .shadow(color: .black, radius: 2, x: -70, y: -15)
                .offset(x: 15, y: 250)
            Image(ImageProvider.sundawn)
                .resizedToFill(width: 250, height: 250)
                .clipShape(Circle())
                .offset(x: 250, y: 360)
                .shadow(color: .orange, radius: 100, x: -20, y: -15)
        }
        .frame(maxWidth: .infinity, maxHeight: 220)
        .shadow(color: ColorProvider.dropShadow, radius: 6, x: 5, y: 5)
        .padding(.top, 10)
        .padding(.bottom, 150)
    }
}

struct WelcomeImages_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      WelcomeView.images
    }
  }
}
