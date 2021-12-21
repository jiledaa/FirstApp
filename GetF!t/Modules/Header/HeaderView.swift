import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var selectedTabManager: SelectedTabManager
    @ObservedObject var headerViewModel: HeaderViewModel
    let titleText: LocalizedStringKey

    var body: some View {
        VStack {
            Text(titleText)
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(.white)
            HStack {
                ForEach(headerViewModel.exercisesCountRange) { index in
                    ZStack {
                        Circle()
                            .frame(width: 32, height: 32)
                            .foregroundColor(.white)
                            .opacity(selectedTabManager.opacity(index))
                        Circle()
                            .frame(width: 16, height: 16)
                            .foregroundColor(.white)
                    }
                    .onTapGesture {
                        selectedTabManager.indexToSelectedTab(index)
                    }
                }
            }
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderView(headerViewModel: HeaderViewModel.init(), titleText: LocalizedStringProvider.ExercisesNames.squat)
                .previewLayout(.sizeThatFits)
            HeaderView(headerViewModel: HeaderViewModel.init(), titleText: LocalizedStringProvider.ExercisesNames.stepUp)
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .accessibilityLarge)
                .previewLayout(.sizeThatFits)
        }
    }
}
