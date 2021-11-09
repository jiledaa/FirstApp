import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            VStack {
                HStack {
                  VStack(alignment: .center) {
                  Text("Get fit")
                    .font(.largeTitle)
                  Text("with high intensity interval training")
                    .font(.headline)
                      Image("step-up")
                          .resizedToFill(width: 240, height: 240)
                          .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                          .shadow(radius: 100)
                          .padding()
                  }
                }

                Button(action: { }) {
                  Text("Get Started")
                  Image(systemName: "arrow.right.circle")
                }
                .font(.title2)
                .padding()
            }

            VStack {
                HeaderView(titleText: "Welcome")
                Spacer()
                Button("History") { }
                  .padding(.bottom)
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
