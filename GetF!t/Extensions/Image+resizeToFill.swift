import SwiftUI

extension Image {
    func resizedToFill(width: CGFloat, height: CGFloat, ratio: CGFloat) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width * ratio, height: height * ratio)
    }
}
