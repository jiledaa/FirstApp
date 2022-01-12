import Foundation

class SettingsManager: ObservableObject {
    @Published var selectedTime: Int = UserDefaults.standard.integer(forKey: StringProvider.selectedTime)

    func saveSelection(_ newValue: Int) {
        UserDefaults.standard.set(selectedTime, forKey: StringProvider.selectedTime)
    }
}
