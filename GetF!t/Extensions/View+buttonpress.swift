import SwiftUI

extension View {
  func buttonPress(_ isPressed: Bool) -> some View {
    self
      .background(
        !isPressed ? AnyView(normal()) : AnyView(pressed())
      )
  }

  func normal() -> some View {
    Capsule()
      .shadow(color: Color("drop-shadow"), radius: 8, x: 6, y: 6)
      .foregroundColor(Color("background"))
  }

  func pressed() -> some View {
    Capsule()
      .inset(by: -4)
      .stroke(Color("background"), lineWidth: 8)
      .shadow(color: Color("drop-shadow"), radius: 4, x: 6, y: 6)
      .shadow(color: Color("drop-highlight"), radius: 4, x: -6, y: -6)
      .foregroundColor(Color("background"))
      .clipShape(Capsule())
  }
}
