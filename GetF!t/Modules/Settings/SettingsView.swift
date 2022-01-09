import Foundation
import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var timeManager: TimerManager
    @State private var selections: [Int] = [10, 50]

    private let data: [[String]] = [
        Array(20...40).map { "\($0)" },
        Array(100...200).map { "\($0)" }
    ]

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                closeButton
                VStack {
                    Text(verbatim: LocalizedStringProvider.Settings.exerciseInterval)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                VStack {
                    PickerView(data: self.data, selections: self.$selections)
                    Text("\(self.data[0][self.selections[0]]) \(self.data[1][self.selections[1]])")
                }
                    Text(verbatim: LocalizedStringProvider.Settings.orderInterval)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding()
            }
                .padding(.top)
            }
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


