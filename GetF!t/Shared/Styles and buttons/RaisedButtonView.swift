import SwiftUI

struct RaisedButtonView: View {
    let buttonText: LocalizedStringKey
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(buttonText)
                .font(.body)
                .fontWeight(.bold)
        }
        .buttonStyle(RaisedButtonStyle())
    }
}

struct RaisedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: 250, maxHeight: 50)
            .background(buttonBackground(isPressed: configuration.isPressed))
    }

    @ViewBuilder
    private func buttonBackground(isPressed: Bool) -> some View{
        if isPressed {
            pressed
        } else {
            normal
        }
    }

    private var normal: some View {
        Capsule()
            .shadow(color: ColorProvider.dropShadow, radius: 8, x: 6, y: 6)
            .foregroundColor(ColorProvider.background)
    }

    private var pressed: some View {
        Capsule()
            .inset(by: -4)
            .stroke(ColorProvider.background, lineWidth: 8)
            .shadow(color: ColorProvider.dropShadow, radius: 4, x: 6, y: 6)
            .shadow(color: ColorProvider.dropHighlight, radius: 4, x: -6, y: -6)
            .foregroundColor(ColorProvider.background)
            .clipShape(Capsule())
    }
}

struct RaisedButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            RaisedButtonView(buttonText: LocalizedStringProvider.Button.getStarted) {
            }
            .buttonStyle(RaisedButtonStyle())
            .padding(20)
        }
        .background(ColorProvider.background)
        .previewLayout(.sizeThatFits)
    }
}
