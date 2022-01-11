import Foundation
import SwiftUI

struct PickerView: UIViewRepresentable {
    @StateObject var timerManager = TimerManager()
    @Binding var selections: [Int]
    var data: [[String]]

    func makeCoordinator() -> PickerView.Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: UIViewRepresentableContext<PickerView>) -> UIPickerView {
        let picker = UIPickerView(frame: .zero)

        picker.dataSource = context.coordinator
        picker.delegate = context.coordinator

        return picker
    }

    func updateUIView(_ view: UIPickerView, context: UIViewRepresentableContext<PickerView>) {
        for i in 0...(self.selections.count - 1) {
            view.selectRow(self.selections[i], inComponent: i, animated: false)
        }
    }

    class Coordinator: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
        var parent: PickerView

        init(_ pickerView: PickerView) {
            self.parent = pickerView
        }

        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return self.parent.data.count
        }

        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return self.parent.data[component].count
        }

        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return self.parent.data[component][row]
        }

        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            self.parent.selections[component] = row
        }
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView(selections: .constant([20]), data: [["1"]])
    }
}
