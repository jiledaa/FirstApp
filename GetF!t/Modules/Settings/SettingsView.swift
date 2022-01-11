import SwiftUI

struct SettingsView: View {
    @StateObject var timerManager = TimerManager()
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
                    Divider()
                    Text(LocalizedStringProvider.Settings.orderInterval)
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                .onAppear {
                    timerManager.loadSelections()
                }
                .onChange(of: timerManager.selections[0]) { newValue in
                    timerManager.updateSelections(newValue: newValue)
                    print("SettingsViewvoe\(timerManager.selections[0])\(newValue)")
                }
                .padding(.top, geometry.size.height * 0.17)
            }
        }
    }

//    @ViewBuilder
//    func picker() -> some View{
//        Picker("seconds", selection: $selections) {
//            Text("1").tag(selections)
//        }
//        Text("\(selections[0])")
//    }

    @ViewBuilder
    func picker(geometry: GeometryProxy ) -> some View {
        HStack {
            PickerView(selections: $timerManager.selections, data: self.data)
                .frame(width: geometry.size.width * 0.6, alignment: .trailing)

            Text("\(data[0][timerManager.selections[0]]) sec")
                .font(.headline)
                .fontWeight(.bold)
                .padding(.all)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
                .background(ColorProvider.dropShadow)
                .cornerRadius(10)
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
