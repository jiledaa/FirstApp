import SwiftUI

struct HistoryBarView: View {
    @EnvironmentObject var history: HistoryViewModel
    
    @State private var days: [Date] = []
    @State private var exercisesForWeek: [ExerciseDay] = []
    @State private var countsForWeek: [Int] = []
    @State private var datesExercised: [Date] = []
    
    var maxBarHeight: Int = 300
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    ForEach(0..<7) { index in
                        bar(day: index, size: geometry.size)
                    }
                }
                Divider()
                Spacer()
            }
            .onAppear {
                days = Date().lastSevenDays
                exercisesForWeek = [ExerciseDay](history.exerciseDays.prefix(7))
                let counts: [Int] = days.map { day in
                    let foundDate = exercisesForWeek.filter {
                        $0.date.yearMonthDay == day.yearMonthDay
                    }
                    return foundDate.first?.exercises.count ?? 0
                }
                assert(counts.count == 7)
                let maxValue = max(counts.max() ?? 0, 1)
                countsForWeek = counts.map {
                    $0 * maxBarHeight / maxValue
                }
            }
            .frame(height: geometry.size.height * 0.7)
        }
    }
    
    func bar(day: Int, size: CGSize) -> AnyView {
        guard days.count > day else {
            return AnyView(EmptyView())
        }
        let date = days[day]
        let view = VStack {
            Spacer()
            ZStack {
                if countsForWeek[day] > 0 {
                    RoundedRectangle(cornerRadius: 10)
                        .padding(3)
                        .foregroundColor(ColorProvider.background)
                        .shadow(
                            color: ColorProvider.dropHighlight,
                            radius: 4,
                            x: -4,
                            y: -4)
                        .shadow(
                            color: ColorProvider.dropShadow,
                            radius: 4,
                            x: 4,
                            y: 4)
                    RoundedRectangle(cornerRadius: 6)
                        .padding(12)
                        .foregroundColor(ColorProvider.historyBar)
                }
            }
            .frame(height: CGFloat(countsForWeek[day]))
            Text(date.truncatedDayName)
            Text(date.truncatedDayMonth)
        }
            .frame(width: size.width / 9)
            .font(.caption)
            .foregroundColor(Color.primary)
        return AnyView(view)
    }
}

struct HistoryBarView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryBarView()
            .environmentObject(HistoryViewModel(debugData: true))
    }
}
