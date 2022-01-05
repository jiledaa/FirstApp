import SwiftUI

struct ModalView: View {
    let modal: Modal

    var body: some View {
        switch modal {
        case .timer:
            TimerView()
        case .history:
            HistoryView()
        case .successView:
            SuccessView()
        }
    }
}

struct Modal_Previews: PreviewProvider {
    static var previews: some View {
        ModalView(modal: .history)
    }
}

