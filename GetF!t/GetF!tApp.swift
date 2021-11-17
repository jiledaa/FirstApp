import SwiftUI

@main
struct GetFit: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
            .onAppear {
              print(FileManager.default.urls(
                for: .documentDirectory,
                in: .userDomainMask))
            }
    }
  }
}
