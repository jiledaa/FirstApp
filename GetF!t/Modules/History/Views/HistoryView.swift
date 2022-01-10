import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var historyViewModel: HistoryViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                closeButton
                VStack {
                    VStack {
                        Text(LocalizedStringProvider.Button.history)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding()
                        buttonLayout
                    }
                    Spacer()
                    historyLayout
                }
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
            .padding([.top, .trailing], 25)
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
