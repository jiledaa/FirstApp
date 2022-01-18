import SwiftUI
import UniformTypeIdentifiers

struct ExercisesDragView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @EnvironmentObject var settingsManager: SettingsManager

    var body: some View {
        LazyHStack {
            ForEach(settingsManager.orderedExercises) { exercise in
                MovableObject(exercise: (exercise.name, exercise.image))
                    .onDrag {
                        settingsManager.onExerciseDragged(exercise: exercise)
                        return NSItemProvider(object: String(exercise.id) as NSString)
                    } preview: {
                        MovableObject(exercise: (exercise.name, exercise.image))
                            .scaleEffect(1.5)
                    }
                    .onDrop(
                        of: [UTType.text],
                        delegate: DragRelocateDelegate(
                            item: exercise,
                            listData: $settingsManager.orderedExercises,
                            current: $settingsManager.draggedExercise
                        )
                    )
            }
        }
        .animation(.default, value: settingsManager.orderedExercises)
        .frame(maxWidth: .infinity)
        .font(.headline)
        .padding(.bottom, 60)
    }
}

struct ExerciseList_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesDragView()
    }
}
