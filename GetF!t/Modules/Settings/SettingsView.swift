import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var settingsManager: SettingsManager
    private let data: [String] = Array(0...180).map(String.init)

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
                    ExerciseListView()
                        .padding(.top, geometry.size.height * 0.05)
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
            PickerView(selection: $settingsManager.selectedTime, data: self.data)
                .frame(width: geometry.size.width * 0.6, alignment: .trailing)

            Text("\(data[settingsManager.selectedTime]) sec")
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
