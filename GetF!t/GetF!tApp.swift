import SwiftUI

@main
struct GetFit: App {
    @StateObject private var historyStore: HistoryViewModel
    @State private var showAlert = false
    
    init() {
        let historyStore: HistoryViewModel
        do {
            historyStore = try HistoryViewModel(withChecking: true)
        } catch {
            print(LocalizedStringProvider.Errors.loadingError1)
            historyStore = HistoryViewModel()
            showAlert = true
        }
        _historyStore = StateObject(wrappedValue: historyStore)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(historyStore)
                .onAppear {
                    print(FileManager.default.urls(
                        for: .documentDirectory,
                        in: .userDomainMask
                    ))
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text(LocalizedStringProvider.Button.history),
                        message: Text(LocalizedStringProvider.Errors.loadingError2)
                    )
                }
        }
    }
}
