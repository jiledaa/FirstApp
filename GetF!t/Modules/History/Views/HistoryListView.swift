import SwiftUI

struct HistoryListView: View {
    @EnvironmentObject var history: HistoryViewModel
    
    var body: some View {
        ScrollView {
            ForEach(history.exerciseDays) { day in
                Section(
                    header:
                        HStack {
                            Text(day.date.formatted(as: "MMM d"))
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
                            let exercise = day.exercises[index]
                            VStack {
                                IndentView {
                                    switch exercise {
                                    case LocalizedStringProvider.ExercisesNames.squat:
                                        Image(systemName: ImageProvider.boltFill)
                                            .frame(minWidth: 60)
                                    case LocalizedStringProvider.ExercisesNames.stepUp:
                                        Image(systemName: ImageProvider.arrowUturnUp)
                                            .frame(minWidth: 60)
                                    case LocalizedStringProvider.ExercisesNames.burpee:
                                        Image(systemName: ImageProvider.hareFill)
                                            .frame(minWidth: 60)
                                    default:
                                        Image(systemName: ImageProvider.sunMaxFill)
                                            .frame(minWidth: 60)
                                    }
                                }
                                .foregroundColor(Color(ColorProvider.BackgroundColor.historyBar))
                                .padding(.bottom, 20)
                                Text(exercise)
                                    .font(.caption)
                                    .fontWeight(.light)
                                    .foregroundColor(Color.primary)
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
}

struct HistoryListView_Previews: PreviewProvider {
  static var previews: some View {
    HistoryListView()
     
  }
}
