import SwiftUI

struct MovableObject: View {
    let exercise: (LocalizedStringKey, String)
    
    var body: some View {
        movableExercise()
    }

    func movableExercise() -> some View {
        VStack {
            IndentView {
                Image(systemName: exercise.1)
                    .frame(minWidth: 60)
            }
            Text(exercise.0)
                .font(.caption)
                .fontWeight(.light)
                .foregroundColor(Color.primary)
                .padding(.top)
        }
        .foregroundColor(ColorProvider.gradientTop)
    }
}

struct Bolt_Previews: PreviewProvider {
    static var previews: some View {
        MovableObject(exercise: (LocalizedStringProvider.ExercisesNames.squat, StringProvider.images.bolt))
    }
}
