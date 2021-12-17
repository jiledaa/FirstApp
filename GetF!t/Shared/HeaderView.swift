import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var selectedTabManager: SelectedTabManager
    let titleText: LocalizedStringKey

    var body: some View {
        VStack {
            Text(titleText)
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(.white)
            HStack {
                ForEach(0 ..< Exercise.exercises.count) { index in
                    ZStack {
                        Circle()
                            .frame(width: 32, height: 32)
                            .foregroundColor(.white)
                            .opacity(index == selectedTabManager.selectedTab ? 0.5 : 0)
                        Circle()
                            .frame(width: 16, height: 16)
                            .foregroundColor(.white)
                    }
                    .onTapGesture {
                       selectedTabManager.selectedTab = index
                    }
                }
            }
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderView(titleText: LocalizedStringProvider.ExercisesNames.squat)
                .previewLayout(.sizeThatFits)
            HeaderView(titleText: LocalizedStringProvider.ExercisesNames.stepUp)
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .accessibilityLarge)
                .previewLayout(.sizeThatFits)
        }
    }
}
