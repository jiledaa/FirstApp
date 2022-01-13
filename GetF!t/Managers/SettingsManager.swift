import Foundation

struct ExercisesForList: Identifiable {
    let id: Int
    var exercise: String
}

class SettingsManager: ObservableObject {

    //MARK: - Picker
    @Published var selectedTime: Int = UserDefaults.standard.integer(forKey: StringProvider.selectedTime)

    func saveSelection(_ newValue: Int) {
        UserDefaults.standard.set(selectedTime, forKey: StringProvider.selectedTime)
    }

    //MARK: - ExerciseList
    var exerciseListt: [ExercisesForList] = []
}
