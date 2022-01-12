import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var historyViewModel: HistoryViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ModalSheetView(text: LocalizedStringProvider.Button.history, circleX: 0.5, circleY: 0.18) {
                    VStack {
                        buttonLayout
                            .padding(.top, geometry.size.height * 0.12)
                            .frame(height: geometry.size.height * 0.15)
                        Spacer()
                        historyLayout
                    }
                    .padding(.top, geometry.size.height * 0.07)
                }
                .padding(.top, geometry.size.height * 0.07)
            }
        }
    }

    @ViewBuilder
    private var historyLayout: some View {
        if historyViewModel.layoutTypeIsList {
            HistoryListView()
        } else {
            HistoryBarView()
        }
    }

    private var buttonLayout: some View {
        HStack {
            switch historyViewModel.layoutType {
            case .list:
                Button(action: {
                }) {
                    ImageProvider.squareGrid2x2Fill
                        .padding(.horizontal)
                }
                .buttonStyle(EmbossedButtonStyle())
                .shadow(color: ColorProvider.dropShadow, radius: 1, x: 2, y: -2)
                .shadow(color: ColorProvider.dropHighlight, radius: 1, x: 2, y: 2)
                Button(action: {
                    historyViewModel.layoutType = .bar
                }) {
                    ImageProvider.chartBarFill
                        .padding(.horizontal)
                        .foregroundColor(.gray)
                }
                .buttonStyle(EmbossedButtonStyle())
            case .bar:
                Button(action: {
                    historyViewModel.layoutType = .list
                }) {
                    ImageProvider.squareGrid2x2Fill
                        .padding(.horizontal)
                        .foregroundColor(.gray)
                }
                .buttonStyle(EmbossedButtonStyle())
                Button(action: {
                }) {
                    ImageProvider.chartBarFill
                        .padding(.horizontal)
                }
                .buttonStyle(EmbossedButtonStyle())
                .shadow(color: ColorProvider.dropShadow, radius: 1, x: 2, y: -2)
                .shadow(color: ColorProvider.dropHighlight, radius: 1, x: 2, y: 2)
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
