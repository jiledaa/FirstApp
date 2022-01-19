import SwiftUI

class ExerciseManagerProvider: ObservableObject {
    @Published var managers: [ExerciseManager] = []
    
    func setupManagersIfEmpty(from exercises: [Exercise]) {
        if managers.isEmpty {
            managers = exercises.map(ExerciseManager.init)
        }
    }
    
    func sortManagers(_ exercises: [Exercise]) {
        managers = exercises.reduce(into: [ExerciseManager]()) { result, exercise in
            if let manager = managers.first(where: { $0.exercise == exercise }) {
                result.append(manager)
            }
        }
    }
}
