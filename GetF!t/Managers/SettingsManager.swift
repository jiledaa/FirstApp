import Foundation
import SwiftUI

class SettingsManager: ObservableObject {
    
    @Published var draggedExercise: Exercise?
    @Published var selectedTime: Int = UserDefaults.standard.integer(forKey: StringProvider.selectedTime)
    @Published var orderedExercises: [Exercise] = {
        guard let data = UserDefaults.standard.data(forKey: StringProvider.orderedExercises),
              let exercises = try? JSONDecoder().decode([Exercise].self, from: data) else { return Exercise.allCases }
        
        return exercises
    }()
    
    let possibleTimeData: [String] = Array(0...180).map(String.init)

    func saveSelection(_ newValue: Int) {
        UserDefaults.standard.set(selectedTime, forKey: StringProvider.selectedTime)
    }
    
    func saveExerciseOrder() {
        guard let encodedExercises = try? JSONEncoder().encode(orderedExercises) else { return }

        UserDefaults.standard.set(encodedExercises, forKey: StringProvider.orderedExercises)
    }
    
    var selectedTimeString: String {
        possibleTimeData[selectedTime]
    }
    
    func onExerciseDragged(exercise: Exercise) {
        draggedExercise = exercise
    }
}

struct DragRelocateDelegate: DropDelegate {
    let item: Exercise
    @Binding var listData: [Exercise]
    @Binding var current: Exercise?

    func dropEntered(info: DropInfo) {
        if item != current {
            let from = listData.firstIndex(of: current!)!
            let to = listData.firstIndex(of: item)!
            if listData[to].id != current!.id {
                listData.move(
                    fromOffsets: IndexSet(integer: from),
                    toOffset: to > from ? to + 1 : to
                )
            }
        }
    }

    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }

    func performDrop(info: DropInfo) -> Bool {
        self.current = nil
        return true
    }
}
