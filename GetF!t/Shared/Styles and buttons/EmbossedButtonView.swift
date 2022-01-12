import SwiftUI

enum EmbossedButtonShape {
    case round, capsule
}

struct EmbossedButtonView: ButtonStyle {
    var buttonShape = EmbossedButtonShape.capsule

    func makeBody(configuration: Configuration) -> some View {
        return configuration.label
            .padding(10)
            .background(
                GeometryReader { geometry in
                    shape(size: geometry.size)
                        .foregroundColor(ColorProvider.background)
                        .shadow(color: ColorProvider.dropShadow, radius: 1, x: -2, y: 2)
                        .shadow(color: ColorProvider.dropHighlight, radius: 1, x: -2, y: -2)
                        .offset(x: -1, y: -1)
                })
    }

    @ViewBuilder
    func shape(size: CGSize) -> some View {
        switch buttonShape {
        case .round:
            Circle()
                .stroke(ColorProvider.background, lineWidth: 2)
                .frame(
                    width: max(size.width, size.height),
                    height: max(size.width, size.height))
                .offset(x: -1)
                .offset(y: -max(size.width, size.height) / 2 +
                        min(size.width, size.height) / 2)
        case .capsule:
            Capsule()
                .stroke(ColorProvider.background, lineWidth: 2)
        }
    }
}

struct EmbossedButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Button(action: {}) {
                Text(LocalizedStringProvider.Button.history)
                    .fontWeight(.bold)
            }
            .buttonStyle(EmbossedButtonView(buttonShape: .round))
            .padding(40)
            .previewLayout(.sizeThatFits)
            Button(action: {}) {
                Text(LocalizedStringProvider.Button.history)
                    .fontWeight(.bold)
            }
            .preferredColorScheme(.dark)
            .buttonStyle(EmbossedButtonView())
            .padding(40)
            .previewLayout(.sizeThatFits)
        }
    }
}
