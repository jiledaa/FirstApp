import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var history: HistoryViewModel
    @Environment(\.presentationMode) var presentationMode
    @Binding var showHistory: Bool
    @State var layoutType = LayoutType.list

    enum LayoutType {
        case list, bar
    }

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
                    if layoutType == .list {
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
            switch layoutType {
            case .list:
                Button(action: {})
                {
                    Image(systemName: ImageProvider.squareGrid2x2Fill)
                        .padding([.leading, .trailing], 20)
                }
                .buttonStyle(EmbossedButtonStyle())
                Button(action: {layoutType = .bar}) {
                    Image(systemName: ImageProvider.chartBarFill)
                        .padding([.leading, .trailing], 20)
                        .foregroundColor(.gray)
                }
                .buttonStyle(EmbossedButtonStyle())
            case .bar:
                Button(action: {layoutType = .list})
                {
                    Image(systemName: ImageProvider.squareGrid2x2Fill)
                        .padding([.leading, .trailing], 20)
                        .foregroundColor(.gray)
                }
                .buttonStyle(EmbossedButtonStyle())
                Button(action: {}) {
                    Image(systemName: ImageProvider.chartBarFill)
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
            Button(action: { presentationMode.wrappedValue.dismiss() }) {
                Image(systemName: ImageProvider.xmark)
                    .foregroundColor(.primary)
            }
            .font(.title2)
            .padding([.top, .trailing], 25)
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(showHistory: .constant(true))
    }
}
