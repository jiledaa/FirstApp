import Foundation

extension Date {
    static let yearMonthDayFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateProvider.yyyyMMdd
        return dateFormatter
    }()

    static let dayNameFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateProvider.EEEE
        return dateFormatter
    }()

    static let truncatedDayNameFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateProvider.EEE
        return dateFormatter
    }()

    static let truncatedDayMonthFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateProvider.ddMMM
        return dateFormatter
    }()

    func formatted(as format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    var yearMonthDay: String {
        Date.yearMonthDayFormatter.string(from: self)
    }

    func isSameDay(as day: Date) -> Bool {
        return self.yearMonthDay == day.yearMonthDay
    }
    
    var dayName: String {
        Date.dayNameFormatter.string(from: self)
    }
    
    var truncatedDayName: String {
        Date.truncatedDayNameFormatter.string(from: self)
    }
    
    var truncatedDayMonth: String {
        Date.truncatedDayMonthFormatter.string(from: self)
    }
    
    var lastSevenDays: [Date] {
        (-6...0).map { day in
            Calendar.current.date(
                byAdding: .day,
                value: day,
                to: Date()) ?? Date()
        }
    }
}
