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
            .padding([.top, .bottom], 12)
            .buttonPress(configuration.isPressed)
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
