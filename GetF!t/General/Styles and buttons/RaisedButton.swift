import SwiftUI

struct RaisedButton: View {
    let buttonText: String
    let action: () -> Void

    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(buttonText)
                .raisedButtonTextStyle()
        })
            .buttonStyle(RaisedButtonStyle())
    }
}

struct RaisedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: 250, maxHeight: 50)
            .padding([.top, .bottom], 12)
            .background(
                Capsule()
                    .foregroundColor(Color("background"))
                    .shadow(color: Color("drop-shadow"), radius: 4, x: -6, y: 2)
                    .shadow(color: Color("drop-highlight"), radius: 4, x: -6, y: -6)
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
            RaisedButton(buttonText: "Get Started") {
                print("Hello World")
            }
            .buttonStyle(RaisedButtonStyle())
            .padding(20)
        }
        .background(Color("background"))
        .previewLayout(.sizeThatFits)
    }
}
