import SwiftUI

struct RatingView: View {
    @ObservedObject var ratingViewModel: RatingViewModel
    @EnvironmentObject var navigationManager: NavigationManager
    @EnvironmentObject var historyViewModel: HistoryViewModel
    @StateObject var timerManager = TimerViewManager()
    @Environment(\.presentationMode) var presentationMode

    let onColor = ColorProvider.ratings
    let offColor = Color.gray
    
    var body: some View {
        VStack {
            VStack {
                Text(LocalizedStringProvider.texts.rating)
                    .italic()
                HStack {
                    rating
                }
            }
            .padding(.vertical)
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
            .onReceive(timerManager.timer, perform: timerManager.onTimeOver)
            .opacity(timerManager.opacity)
        }
        .onAppear {
            guard let key = ratingViewModel.exercise else {
                return
            }
            ratingViewModel.loadRating(exercise: key)
        }
        .padding(.vertical)
    }

    private var ratingButton: some View {
        ForEach(1 ..< ratingViewModel.maximumRating + 1, id: \.self) { index in
            Button(action: {
                ratingViewModel.updateRating(index: index)
                presentationMode.wrappedValue.dismiss()
                historyViewModel.onDoneTapped(navigationManager.nameForHistorySave())
                navigationManager.onDoneTapped()
            }) {
                ImageProvider.waveform
                    .foregroundColor(
                        ratingViewModel.ratingActive(index) ? offColor : onColor)
                    .font(.title3)
            }
            .buttonStyle(EmbossedButtonStyle(buttonShape: .round))
        }
    }

    private var rating: some View {
        ForEach(1 ..< ratingViewModel.maximumRating + 1, id: \.self) { index in
            Button(action: {
            }) {
                ImageProvider.waveform
                    .foregroundColor(
                        ratingViewModel.ratingActive(index) ? offColor : onColor)
                    .font(.title3)
            }
            .buttonStyle(EmbossedButtonStyle(buttonShape: .round))
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        return RatingView(ratingViewModel: .init())
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
