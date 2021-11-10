import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            VStack {
                HStack {
                  VStack(alignment: .center) {
                  Text("Getf!t")
                          .font(.custom("Getfit", size: 50))
                          .foregroundColor(.green)
                          .bold()
                      Image("step-up")
                          .resizedToFill(width: 240, height: 240)
                          .clipShape(Circle())
                          .shadow(radius: 80)
                          .padding()
                      Text("with high intensity interval training")
                              .font(.headline)
                              .italic()
                  }
                }
            }

            VStack {
                HeaderView(titleText: "Welcome")
                Spacer()
                Button(action: { }) {
                  Text("Get Started")
                  Image(systemName: "arrow.right.circle")
                }
                .font(.custom("Get started", size: 28))
                .padding(90)
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
