import Foundation
import SwiftUI

class SettingsManager: ObservableObject {

    @Published var selectedTime: Int = UserDefaults.standard.integer(forKey: StringProvider.selectedTime)
    @Published var orderedExercises = UserDefaults.standard.array(forKey: StringProvider.orderedExercises) as? [Exercise] ?? Exercise.allCases

    func saveSelection(_ newValue: Int) {
        UserDefaults.standard.set(selectedTime, forKey: StringProvider.selectedTime)
    }
    
    func saveExerciseOrder() {
        UserDefaults.standard.set(orderedExercises, forKey: StringProvider.orderedExercises)
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
