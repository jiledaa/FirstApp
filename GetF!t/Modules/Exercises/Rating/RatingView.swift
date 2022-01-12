import SwiftUI

struct RatingView: View {
    @ObservedObject var exerciseManager: ExerciseManager
    @EnvironmentObject var navigationManager: NavigationManager
    @EnvironmentObject var historyViewModel: HistoryViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text(LocalizedStringProvider.Button.done)
                .font(.largeTitle)
            Text(LocalizedStringProvider.texts.ratingButton)
                .italic()
            HStack {
                ratingButton
            }
            .shadow(color: ColorProvider.dropShadow, radius: 1, x: -2, y: 2)
            .shadow(color: ColorProvider.dropHighlight, radius: 1, x: -2, y: -2)
        }
        .padding(.vertical)
        .opacity(exerciseManager.opacity)
    }

    private var ratingButton: some View {
        ForEach(1 ..< exerciseManager.maximumRating + 1, id: \.self) { index in
            Button(action: {
                exerciseManager.updateRating(index: index)
                historyViewModel.onDoneTapped(navigationManager.nameForHistorySave())
                presentationMode.wrappedValue.dismiss()
                navigationManager.onDoneTapped()
            }) {
                ImageProvider.waveform
                    .foregroundColor(
                        exerciseManager.ratingActive(index) ? exerciseManager.offColor : exerciseManager.onColor)
                    .font(.title3)
            }
            .buttonStyle(EmbossedButtonStyle(buttonShape: .round))
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        return RatingView(exerciseManager: .init(exercise: .exercises[0]))
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
