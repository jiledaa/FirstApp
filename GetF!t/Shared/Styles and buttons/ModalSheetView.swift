import SwiftUI

struct ModalSheetView<Content: View>: View {
    @Environment(\.presentationMode) var presentationMode

    var content: Content

    init(text:LocalizedStringKey, circleX: CGFloat, circleY: CGFloat, @ViewBuilder content: () -> Content) {
        self.text = text
        self.circleX = circleX
        self.circleY = circleY
        self.content = content()
    }

    let text: LocalizedStringKey
    let circleX: CGFloat
    let circleY: CGFloat

    var body: some View {
        ZStack(alignment: .top) {
            closeButton
            Text(text)
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(.white)
                .padding(.top)
                .padding(.top)
        }
        content
    }

    var closeButton: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topTrailing) {
                ColorProvider.background
                    .overlay(
                        GradientBackground()
                            .mask(circle(size: geometry.size, x: circleX, y: circleY))
                    )
                    .edgesIgnoringSafeArea(.all)
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    ImageProvider.xmark
                        .foregroundColor(.primary)
                }
                .font(.title2)
                .padding([.top, .trailing])
            }
        }
    }
    
    private func circle(size: CGSize, x: CGFloat, y: CGFloat) -> some View {
        Circle()
            .frame(
                width: size.width,
                height: size.height)
            .position(
                x: size.width * x,
                y: -size.width * y)
    }
}

struct ModalSheetHeader_Previews: PreviewProvider {
    static var previews: some View {
        ModalSheetView(text: LocalizedStringProvider.WelcomePage.history, circleX: 5, circleY: 1.8) {
        }
    }
}
