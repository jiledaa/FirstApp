import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var history: HistoryStore
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
                        Text("History")
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
            if layoutType == .list {
                Button(action: {
                    layoutType = .bar
                }, label: {
                    Image(systemName: "square.grid.2x2.fill")
                        .padding([.leading, .trailing], 20)
                })
                    .buttonStyle(EmbossedButtonStyle())
                Button(action: {
                    layoutType = .bar
                }, label: {
                    Image(systemName: "chart.bar.fill")
                        .padding([.leading, .trailing], 20)
                        .foregroundColor(.gray)
                })
            } else {
                Button(action: {
                    layoutType = .list
                }, label: {
                    Image(systemName: "square.grid.2x2.fill")
                        .padding([.leading, .trailing], 20)
                        .foregroundColor(.gray)
                })
                Button(action: {
                    layoutType = .list
                }, label: {
                    Image(systemName: "chart.bar.fill")
                        .padding([.leading, .trailing], 20)
                })
                    .buttonStyle(EmbossedButtonStyle())
            }
        }
    }

    var closeButton: some View {
        ZStack(alignment: .topTrailing) {
            Color("background")
                .edgesIgnoringSafeArea(.all)
            Button(action: {
                presentationMode.wrappedValue.dismiss()
                // swiftlint:disable:next multiple_closures_with_trailing_closure
            }) {
                Image(systemName: "xmark")
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
