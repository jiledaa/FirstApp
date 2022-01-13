import SwiftUI

struct MovableObject: View {
    @State private var draggedOfset = CGSize.zero
    let imageName: String
    let exercise: LocalizedStringKey
    
    var body: some View {
        movableExercise()

    }

    func movableExercise() -> some View {
        VStack {
            IndentView {
                Image(systemName: imageName)
                    .frame(minWidth: 60)
            }
            .padding(.bottom)
            Text(exercise)
                .font(.caption)
                .fontWeight(.light)
                .foregroundColor(Color.primary)
        }
        .animation(.linear, value: 3)
        .offset(x: self.draggedOfset.width)
        .gesture(DragGesture()
                    .onChanged{ value in
            self.draggedOfset = value.translation
        }
                    .onEnded { value in
            self.draggedOfset = CGSize.zero
        })
        .foregroundColor(ColorProvider.gradientTop)
        .padding(.bottom)
    }
}

struct Bolt_Previews: PreviewProvider {
    static var previews: some View {
        MovableObject(imageName: StringProvider.images.bolt, exercise: LocalizedStringProvider.ExercisesNames.squat)
    }
}
