import SwiftUI

import SwiftUI

extension WelcomeView {
  static var images: some View {
    ZStack {
      Image("exercise")
        .resizedToFill(width: 40, height: 40)
        .clipShape(Circle())
        .offset(x: -220, y: -210)
      Image("head")
        .resizedToFill(width: 60, height: 60)
        .clipShape(Circle())
        .offset(x: -150, y: -170)
      Image("arm")
        .resizedToFill(width: 80, height: 80)
        .clipShape(Circle())
        .offset(x: -60, y: -110)
      Image("hands")
        .resizedToFill(width: 130, height: 130)
        .clipShape(Circle())
        .offset(x:40, y: -25)
      Image("step-up")
        .resizedToFill(width: 190, height: 190)
        .clipShape(Circle())
        .offset(x: 160, y: 130)
      Image("sundawn")
        .resizedToFill(width: 250, height: 250)
        .clipShape(Circle())
        .offset(x: 250, y: 360)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
    .frame(maxWidth: .infinity, maxHeight: 220)
    .shadow(color: Color("drop-shadow"), radius: 6, x: 5, y: 5)
    .padding(.top, 10)
    .padding(.bottom, 10)
  }

  static var welcomeText: some View {
    return HStack(alignment: .bottom) {
        VStack(alignment: .center) {
        Text("Getf!t")
          .font(.largeTitle)
          .fontWeight(.black)
          .kerning(3)
          .shadow(color: .black, radius:2, x: -60, y: -25)
          .padding(30)
        Text(NSLocalizedString("with high intensity interval training", comment: "postscript"))
            .font(.headline)
            .fontWeight(.medium)
            .kerning(2)
          .shadow(color: .black, radius:2, x: -60, y: -15)      }
    }
  }
}

struct WelcomeImages_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      WelcomeView.images
      WelcomeView.welcomeText
    }
  }
}
