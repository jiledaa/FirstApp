import Foundation

extension Date {
    static let yearMonthDayFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatProvider.yyyyMMdd
        return dateFormatter
    }()

    static let dayNameFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatProvider.EEEE
        return dateFormatter
    }()

    static let truncatedDayNameFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatProvider.EEE
        return dateFormatter
    }()

    static let truncatedDayMonthFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatProvider.ddMMM
        return dateFormatter
    }()

    static let truncatedMonthDayFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatProvider.MMMd
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

    var truncatedMonthDay: String {
        Date.truncatedMonthDayFormatter.string(from: self)
    }
    
    var lastSevenDays: [Date] {
        (-6...0).map { day in
            Calendar.current.date(
                byAdding: .day,
                value: day,
                to: Date()
            ) ?? Date()
        }
    }
}
