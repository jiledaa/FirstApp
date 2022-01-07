import Foundation
import SwiftUI

struct ExerciseDay: Identifiable {
    let id = UUID()
    let date: Date
    var exercises: [String] = []
}

class HistoryViewModel: ObservableObject {
    @Published var exerciseDays: [ExerciseDay] = []
    @Published var layoutType = LayoutType.list
    @Published var days: [Date] = []
    @Published var exercisesForWeek: [ExerciseDay] = []
    @Published var countsForWeek: [Int] = []
    @Published var datesExercised: [Date] = []

    var maxBarHeight: Int = 300

    enum LayoutType {
        case list, bar
    }

    var layoutTypeIsList: Bool {
        layoutType == .list
    }

    enum FileError: Error {
        case loadFailure
        case saveFailure
        case urlFailure
    }

    func propertySetup() {
        days = Date().lastSevenDays
        exercisesForWeek = [ExerciseDay](exerciseDays.prefix(7))

        let lastWeekExerciseCount: [Int] = days.map { day in
            let foundDate = exercisesForWeek.filter {
                $0.date.yearMonthDay == day.yearMonthDay
            }
            return foundDate.first?.exercises.count ?? 0
        }

        let maxValue = max(lastWeekExerciseCount.max() ?? 0, 1)
        countsForWeek = lastWeekExerciseCount.map {
            $0 * maxBarHeight / maxValue
        }
    }

    init() {
    }

    init(withChecking: Bool) throws {
#if DEBUG
        //    createDevData()
#endif
        do {
            try load()
        } catch {
            throw error
        }
    }

    func getURL() -> URL? {
        guard let documentsURL = FileManager.default.urls(
            for: .documentDirectory, in: .userDomainMask).first else {
                return nil
            }
        return documentsURL.appendingPathComponent(StringProvider.historyPlist)
    }

    func load() throws {
        guard let dataURL = getURL() else {
            throw FileError.urlFailure
        }
        guard let data = try? Data(contentsOf: dataURL) else {
            return
        }
        let plistData = try PropertyListSerialization.propertyList(
            from: data,
            options: [],
            format: nil)
        let convertedPlistData = plistData as? [[Any]] ?? []
        exerciseDays = convertedPlistData.map {
            ExerciseDay(
                date: $0[1] as? Date ?? Date(),
                exercises: $0[2] as? [String] ?? [])
        }
    }

    func save() throws {
        guard let dataURL = getURL() else {
            throw FileError.urlFailure
        }
        let plistData = exerciseDays.map {
            [$0.id.uuidString, $0.date, $0.exercises]
        }
//        let wev = (plistData[0][2] as AnyObject).stringValue()
//        print("mamurl\(wev)")
        do {
            let data = try PropertyListSerialization.data(
                fromPropertyList: plistData,
                format: .binary,
                options: .zero)
            try data.write(to: dataURL, options: .atomic)
        } catch {
            throw FileError.saveFailure
        }
    }

    private func addDoneExercise(_ exerciseName: String) {
        let today = Date()
        if let firstDate = exerciseDays.first?.date,
           today.isSameDay(as: firstDate) {
            exerciseDays[0].exercises.append(exerciseName)
        } else {
            exerciseDays.insert(
                ExerciseDay(date: today, exercises: [exerciseName]),
                at: 0)
        }
    }

    func onDoneTapped(_ exerciseName: String) {
        addDoneExercise(exerciseName)
    }

    func savingHistory() {
        do {
          try save()
        } catch {
          fatalError(error.localizedDescription)
        }
    }
}

extension LocalizedStringKey {
    var stringKey: String {
        let description = "\(self)"

        let components = description.components(separatedBy: "key: \"")
            .map { $0.components(separatedBy: "\",") }

        return components[1][0]
    }
}

extension String {
    static func localizedString(for key: String,
                                locale: Locale = .current) -> String {

        let language = locale.languageCode
        let path = Bundle.main.path(forResource: language, ofType: "lproj")!
        let bundle = Bundle(path: path)!
        let localizedString = NSLocalizedString(key, bundle: bundle, comment: "")

        return localizedString
    }
}

extension LocalizedStringKey {
    func stringValue(locale: Locale = .current) -> String {
        return .localizedString(for: self.stringKey, locale: locale)
    }
}

