import Foundation
import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var timeManager: TimerManager

    var body: some View {
        GeometryReader { geometry in
            closeButton
        }
    }

    var closeButton: some View {
        ZStack(alignment: .topTrailing) {
            ColorProvider.background
                .edgesIgnoringSafeArea(.all)
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                ImageProvider.xmark
                    .foregroundColor(.primary)
            }
            .font(.title2)
            .padding([.top, .trailing])
        }
    }
}


