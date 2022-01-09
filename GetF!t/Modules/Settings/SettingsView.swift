import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var timeManager: TimerManager
    @State private var selections: [Int] = [10]

    private let data: [[String]] = [
        Array(0...180).map { "\($0)" }
    ]

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                ModalSheetHeader(text: LocalizedStringProvider.Settings.settings, circleX: 0.5, circleY: 0.18)
                VStack {
                    Text(LocalizedStringProvider.Settings.exerciseInterval)
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    picker(geometry: geometry)
                    .padding(.trailing)
                    Divider()
                    Text(LocalizedStringProvider.Settings.orderInterval)
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                .padding(.top, geometry.size.height * 0.17)
            }
        }
    }
    
@ViewBuilder
    func picker(geometry: GeometryProxy ) -> some View {
        HStack {
            PickerView(selections: self.$selections, data: self.data)
                .frame(width: geometry.size.width * 0.6, alignment: .trailing)

        Text("\(self.data[0][self.selections[0]])sec")
            .font(.headline)
            .fontWeight(.bold)
            .padding(.all)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
            .background(ColorProvider.dropShadow)
            .cornerRadius(10)
    }
    }
    var closeButton: some View {
        GeometryReader { geometry in
        ZStack(alignment: .topTrailing) {
            ColorProvider.background
                .overlay(
                    GradientBackground()
                        .mask(circle(size: geometry.size))
                )
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
    
    private func circle(size: CGSize) -> some View {
        Circle()
            .frame(
                width: size.width,
                height: size.height)
            .position(
                x: size.width * 0.5,
                y: -size.width * 0.18)
    }
}



struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
