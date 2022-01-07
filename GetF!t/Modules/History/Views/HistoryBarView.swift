import SwiftUI

struct HistoryBarView: View {
    @EnvironmentObject var historyViewModel: HistoryViewModel

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
                historyViewModel.propertySetup()
            }
            .frame(height: geometry.size.height * 0.7)
        }
    }
    
    func bar(day: Int, size: CGSize) -> AnyView {
        guard historyViewModel.days.count > day else {
            return AnyView(EmptyView())
        }
        let date = historyViewModel.days[day]
        let view = VStack {
            Spacer()
            ZStack {
                if historyViewModel.countsForWeek[day] > 0 {
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
            .frame(height: CGFloat(historyViewModel.countsForWeek[day]))
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
            .environmentObject(HistoryViewModel())
    }
}
