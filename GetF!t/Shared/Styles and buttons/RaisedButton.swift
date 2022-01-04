import SwiftUI

struct RaisedButton: View {
    let buttonText: LocalizedStringKey
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(buttonText)
                .raisedButtonTextStyle()
        }
        .buttonStyle(RaisedButtonStyle())
    }
}

struct RaisedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: 250, maxHeight: 50)
            .padding(.vertical, 12)
            .background(
                Capsule()
                    .foregroundColor(ColorProvider.background)
                    .shadow(color: ColorProvider.dropShadow, radius: 4, x: -6, y: 2)
                    .shadow(color: ColorProvider.dropHighlight, radius: 4, x: -6, y: -6)
            )
    }
}

extension Text {
    func raisedButtonTextStyle() -> some View {
        self
            .font(.body)
            .fontWeight(.bold)
    }
}

struct RaisedButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            RaisedButton(buttonText: LocalizedStringProvider.Button.getStarted) {

            }
            .buttonStyle(RaisedButtonStyle())
            .padding(20)
        }
        .background(ColorProvider.background)
        .previewLayout(.sizeThatFits)
    }
}
