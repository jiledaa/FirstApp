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
                closeButton
                VStack {
                    Text(LocalizedStringProvider.Settings.settings)
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                        .padding(.bottom, geometry.size.height * 0.06)
                    Text(verbatim: LocalizedStringProvider.Settings.exerciseInterval)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    HStack {
                        PickerView(data: self.data, selections: self.$selections)
                            .frame(width: geometry.size.width * 0.6, alignment: .trailing)
                        Text("\(self.data[0][self.selections[0]])sec")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding(.all)
                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
                            .background(ColorProvider.dropShadow)
                            .cornerRadius(10)
                    }
                    .padding(.trailing)
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
