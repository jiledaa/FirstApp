import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var history: HistoryViewModel
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
                        layout
                    }
                    .frame(height: geometry.size.height * 0.15)
                    Spacer()
                    if history.layoutTypeIsList {
                        HistoryListView()
                    } else {
                        HistoryBarView()
                    }
                }
            }
        }
    }

    var layout: some View {
        HStack {
            switch history.layoutType {
            case .list:
                Button(action: {
                }) {
                    ImageProvider.squareGrid2x2Fill
                        .padding([.leading, .trailing], 20)
                }
                .buttonStyle(EmbossedButtonStyle())
                Button(action: {
                   history.layoutType = .bar
                }) {
                    ImageProvider.chartBarFill
                        .padding([.leading, .trailing], 20)
                        .foregroundColor(.gray)
                }
                .buttonStyle(EmbossedButtonStyle())
            case .bar:
                Button(action: {
                   history.layoutType = .list
                }) {
                    ImageProvider.squareGrid2x2Fill
                        .padding([.leading, .trailing], 20)
                        .foregroundColor(.gray)
                }
                .buttonStyle(EmbossedButtonStyle())
                Button(action: {
                }) {
                    ImageProvider.chartBarFill
                        .padding([.leading, .trailing], 20)
                }
                .buttonStyle(EmbossedButtonStyle())
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
