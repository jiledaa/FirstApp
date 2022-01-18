import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var settingsManager: SettingsManager

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                ModalSheetView(text: LocalizedStringProvider.Settings.settings, circleX: 0.5, circleY: 0.14) {
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
                    ExercisesDragView()
                }
                .padding(.top, geometry.size.height * 0.2)
                }
            }
        }
        .onChange(of: settingsManager.selectedTime, perform: settingsManager.saveSelection)
    }

    @ViewBuilder
    func picker(geometry: GeometryProxy) -> some View {
        HStack {
            PickerView(selection: $settingsManager.selectedTime, data: settingsManager.possibleTimeData)
                .frame(width: geometry.size.width * 0.6, alignment: .trailing)

            Text("\(settingsManager.selectedTimeString) sec")
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
