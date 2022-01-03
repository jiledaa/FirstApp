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
                        ForEach(0..<min(day.exercises.count, 4)) { index in
                            exercisesSwitch(exercise: day.exercises[index])
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .font(.headline)
                }
            }
        }
        .frame(maxWidth: .infinity)
    }

    func exercisesSwitch(exercise: LocalizedStringKey) -> some View {
        VStack {
            IndentView {
                switch exercise {
                case LocalizedStringProvider.ExercisesNames.squat:
                    ImageProvider.boltFill
                        .frame(minWidth: 60)
                case LocalizedStringProvider.ExercisesNames.stepUp:
                    ImageProvider.arrowUturnUp
                        .frame(minWidth: 60)
                case LocalizedStringProvider.ExercisesNames.burpee:
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
            .environmentObject(HistoryViewModel(debugData: true))
    }
}
