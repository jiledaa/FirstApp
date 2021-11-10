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
                      Text(NSLocalizedString("with high intensity interval training", comment: "postscript"))
                              .font(.headline)
                              .italic()
                  }
                }
            }

            VStack {
                HeaderView(titleText: NSLocalizedString("Welcome", comment: "greeting"))
                Spacer()
                Button(action: { }) {
                  Text(NSLocalizedString("Get started", comment: "StartButton"))
                  Image(systemName: "arrow.right.circle")
                }
                .font(.custom("Get started", size: 28))
                .padding(90)
                Button(NSLocalizedString("History", comment: "view user activity")) { }
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
