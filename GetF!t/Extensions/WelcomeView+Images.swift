import SwiftUI

extension WelcomeView {
    static var width = 40
    
    static var images: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 30) {
                ImageProvider.exercise
                    .resizedToFill(width: 40, height: 40, ratio: 1)
                    .clipShape(Circle())
                ImageProvider.head
                    .resizedToFill(width: 40, height: 40, ratio: 2)
                    .clipShape(Circle())
                ImageProvider.arm
                    .resizedToFill(width: 40, height: 40, ratio: 3)
                    .clipShape(Circle())
                ImageProvider.hands
                    .resizedToFill(width: 40, height: 40, ratio: 4)
                    .clipShape(Circle())
                ImageProvider.stepUp
                    .resizedToFill(width: 40, height: 40, ratio: 5)
                    .clipShape(Circle())
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
            .padding(.leading, 100)
        }
        .frame(maxWidth: .infinity, maxHeight: 220)
        .padding(.top, 70)
        .padding(.bottom,50)
        .padding(.trailing, 10)
    }
}

struct WelcomeImages_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            WelcomeView.images
        }
    }
}
