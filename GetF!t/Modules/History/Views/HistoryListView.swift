import SwiftUI

struct HistoryListView: View {
    @EnvironmentObject var historyViewModel: HistoryViewModel
    
    var body: some View {
        ScrollView {
            ForEach(historyViewModel.exerciseDays) { day in
                Section(
                    header:
                        HStack {
                            Text(day.date.formatted(as: DateFormatProvider.MMMd))
                                .font(.title3)
                                .fontWeight(.medium)
                                .padding()
                            Spacer()
                        },
                    footer:
                        Divider()
                        .padding(.top, 40)
                ) {
                    HStack(spacing: 40) {
                        LazyVGrid(columns: [GridItem(), GridItem(), GridItem(), GridItem(), GridItem()]) {
                            ForEach(0..<day.exercises.count) { index in
                                exercisesSwitch(exercise: day.exercises[index])
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .font(.headline)
                }
            }
        }
        .frame(maxWidth: .infinity)
    }

    func exercisesSwitch(exercise: String) -> some View {
        VStack {
            IndentView {
                switch exercise {
                case StringProvider.ExercisesNamesVideo.squat:
                    ImageProvider.boltFill
                        .frame(minWidth: 60)
                case StringProvider.ExercisesNamesVideo.stepUp:
                    ImageProvider.arrowUturnUp
                        .frame(minWidth: 60)
                case StringProvider.ExercisesNamesVideo.burpee:
                    ImageProvider.hareFill
                        .frame(minWidth: 60)
                default:
                    ImageProvider.sunMaxFill
                        .frame(minWidth: 60)
                }
            }
            .foregroundColor(ColorProvider.gradientTop)
            .padding(.bottom, 20)
            Text(exercise)
                .font(.caption)
                .fontWeight(.light)
                .foregroundColor(Color.primary)
        }
    }
}

struct HistoryListView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryListView()
            .environmentObject(HistoryViewModel())
    }
}
