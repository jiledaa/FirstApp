import Foundation
import SwiftUI

class SettingsManager: ObservableObject {

    //MARK: - Picker
    @Published var selectedTime: Int = UserDefaults.standard.integer(forKey: StringProvider.selectedTime)

    func saveSelection(_ newValue: Int) {
        UserDefaults.standard.set(selectedTime, forKey: StringProvider.selectedTime)
    }
}

struct ExerciseData: Identifiable, Equatable {
    var id: String {
        image
    }

    let title: LocalizedStringKey
    let image: String
}

struct DragRelocateDelegate: DropDelegate {
    let item: ExerciseData
    @Binding var listData: [ExerciseData]
    @Binding var current: ExerciseData?

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
