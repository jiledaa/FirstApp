import SwiftUI

struct WelcomeView: View {
    @State private var showHistory = false
    @Binding var selectedTab: Int

    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(
                    selectedTab: $selectedTab,
                    titleText: NSLocalizedString("Welcome", comment: "Wilkommen!"))
                Spacer()
                ContainerView {
                    VStack {
                        WelcomeView.images
                            .padding(110)
                        getStartedButton
                        Spacer()
                        historyButton
                          .sheet(isPresented: $showHistory) {
                            HistoryView(showHistory: $showHistory)
                          }
                      }
                    }
                    .frame(height: geometry.size.height * 0.7)
            }
        } 
    }

    var getStartedButton: some View {
      RaisedButton(buttonText: NSLocalizedString("Get started", comment: "Starten!")) {
        selectedTab = 0
      }
      .padding(100)
    }

    var historyButton: some View {
      Button(
        action: {
          showHistory = true
        }, label: {
          Text("History")
            .fontWeight(.bold)
            .padding([.leading, .trailing], 5)
        })
        .padding(.bottom, 300)
        .buttonStyle(EmbossedButtonStyle())
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(selectedTab: .constant(9))
    }
}
