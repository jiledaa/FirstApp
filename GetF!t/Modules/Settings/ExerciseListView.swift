import SwiftUI
import UniformTypeIdentifiers

struct ExerciseListView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @EnvironmentObject var settingsManager: SettingsManager
    @State var dragging: Exercise?

    var body: some View {
        LazyHStack {
            ForEach(settingsManager.orderedExercises) { exercise in
                MovableObject(exercise: (exercise.name, exercise.image))
                    .onDrag {
                        self.dragging = exercise
                        return NSItemProvider(object: String(exercise.id) as NSString)
                    } preview: {
                        MovableObject(exercise: (exercise.name, exercise.image))
                            .scaleEffect(0.8)
                    }
                    .onDrop(of: [UTType.text], delegate: DragRelocateDelegate(item: exercise, listData: $settingsManager.orderedExercises, current: $dragging))
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
        ExerciseListView()
    }
}
