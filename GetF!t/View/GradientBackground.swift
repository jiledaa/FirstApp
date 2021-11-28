import SwiftUI

struct GradientBackground: View {
    var gradient: Gradient {
        let color1 = Color("gradient-top")
        let color2 = Color("drop-highlight")
        return Gradient(
            stops: [
                Gradient.Stop(color: color1, location: 0),
                Gradient.Stop(color: color2, location: 0.9),
            ])
    }
    
    var body: some View {
        LinearGradient(
            gradient: gradient,
            startPoint: .top,
            endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
    }
}

struct GradientBackground_Previews: PreviewProvider {
    static var previews: some View {
        GradientBackground()
            .frame(width: 300, height: 100)
            .previewLayout(.sizeThatFits)
    }
}
