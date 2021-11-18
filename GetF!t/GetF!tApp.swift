import SwiftUI

@main
struct GetFit: App {
  @StateObject private var historyStore: HistoryStore
  @State private var showAlert = false

  init() {
    let historyStore: HistoryStore
    do {
      historyStore = try HistoryStore(withChecking: true)
    } catch {
      print(NSLocalizedString("Could not load history data", comment: "LoadingError"))
      historyStore = HistoryStore()
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
            in: .userDomainMask))
        }
        .alert(isPresented: $showAlert) {
          Alert(
            title: Text(NSLocalizedString("History", comment: "view user activity")),
            message: Text(NSLocalizedString("LoadingError" , comment: "HistoryError")
              ))
        }
    }
  }
}
