import SwiftUI

struct ContainerView<Content: View>: View {
    var content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundColor(ColorProvider.background)
            VStack {
                Spacer()
                Rectangle()
                    .frame(height: 25)
                    .foregroundColor(ColorProvider.background)
            }
            content
        }
    }
}

struct Container_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView {
            VStack {
                RaisedButtonView(buttonText: LocalizedStringProvider.Button.history) {}
                .padding(50)
                Button(LocalizedStringProvider.Button.history) {}
                .buttonStyle(EmbossedButtonView(buttonShape: .round))
            }
        }
        .padding(50)
        .previewLayout(.sizeThatFits)
    }
}
