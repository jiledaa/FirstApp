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
                            .font(.largeTitle)
                            .fontWeight(.black)
                            .foregroundColor(.white)
                        buttonLayout
                            .padding()
                    }
                    .frame(height: geometry.size.height * 0.15)
                    Spacer()
                    historyLayout
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
                .buttonStyle(EmbossedButtonView())
                .shadow(color: ColorProvider.dropShadow, radius: 1, x: 2, y: -2)
                .shadow(color: ColorProvider.dropHighlight, radius: 1, x: 2, y: 2)
                Button(action: {
                    historyViewModel.layoutType = .bar
                }) {
                    ImageProvider.chartBarFill
                        .padding(.horizontal)
                        .foregroundColor(.gray)
                }
                .buttonStyle(EmbossedButtonView())
            case .bar:
                Button(action: {
                    historyViewModel.layoutType = .list
                }) {
                    ImageProvider.squareGrid2x2Fill
                        .padding(.horizontal)
                        .foregroundColor(.gray)
                }
                .buttonStyle(EmbossedButtonView())
                Button(action: {
                }) {
                    ImageProvider.chartBarFill
                        .padding(.horizontal)
                }
                .buttonStyle(EmbossedButtonView())
                .shadow(color: ColorProvider.dropShadow, radius: 1, x: 2, y: -2)
                .shadow(color: ColorProvider.dropHighlight, radius: 1, x: 2, y: 2)
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
                y: -size.width * 0.2)
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
