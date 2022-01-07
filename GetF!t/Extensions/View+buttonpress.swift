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
          .shadow(color: ColorProvider.dropShadow, radius: 8, x: 6, y: 6)
          .foregroundColor(ColorProvider.background)
  }

  func pressed() -> some View {
    Capsule()
      .inset(by: -4)
      .stroke(ColorProvider.background, lineWidth: 8)
      .shadow(color: ColorProvider.dropShadow, radius: 4, x: 6, y: 6)
      .shadow(color: ColorProvider.dropHighlight, radius: 4, x: -6, y: -6)
      .foregroundColor(ColorProvider.background)
      .clipShape(Capsule())
  }
}
