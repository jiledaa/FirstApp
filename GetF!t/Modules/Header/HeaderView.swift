import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var selectedTabManager: SelectedTabManager

    var body: some View {
        VStack {
            Text(selectedTabManager.titleText)
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(.white)
            HStack {
                ForEach(0 ..< Exercise.exercises.count) { tab in
                    ZStack {
                        Circle()
                            .frame(width: 32, height: 32)
                            .foregroundColor(.white)
                            .opacity(selectedTabManager.opacity(tab))
                        Circle()
                            .frame(width: 16, height: 16)
                            .foregroundColor(.white)
                    }
                    .onTapGesture {
                        selectedTabManager.goTo(tab)
                    }
                }
            }
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderView()
                .previewLayout(.sizeThatFits)
            HeaderView()
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .accessibilityLarge)
                .previewLayout(.sizeThatFits)
        }
    }
}
