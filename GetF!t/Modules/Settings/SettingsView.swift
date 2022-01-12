import SwiftUI

struct SettingsView: View {
    @StateObject var timerManager = TimerManager()

    private let data: [String] = Array(0...180).map(String.init)

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
                    timerManager.loadSelection()
                }
                .onChange(of: timerManager.selectedTime) { newValue in
                    timerManager.updateSelection(newValue: newValue)
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
            PickerView(selection: $timerManager.selectedTime, data: self.data)
                .frame(width: geometry.size.width * 0.6, alignment: .trailing)

            Text("\(data[timerManager.selectedTime]) sec")
                .foregroundColor(.white)
                .font(.headline)
                .fontWeight(.bold)
                .padding(.all)
                .background(ColorProvider.gradientTop)
                .cornerRadius(10)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
