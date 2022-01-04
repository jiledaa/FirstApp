import SwiftUI

struct Modal: View {
    let modalType: ModalType
    
    var body: some View {
        switch modalType {
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
        Modal(modalType: .history)
    }
}
