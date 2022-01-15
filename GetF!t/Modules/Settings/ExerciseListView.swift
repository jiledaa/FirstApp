import SwiftUI
import UniformTypeIdentifiers

struct ExerciseListView: View {
    @State private var draggedOfset = CGSize.zero
    @State var dragging: GridData?
    @State var exerciseList = [GridData.init(title: LocalizedStringProvider.ExercisesNames.squat, image: StringProvider.images.bolt), GridData.init(title: LocalizedStringProvider.ExercisesNames.stepUp, image: StringProvider.images.arrow), GridData.init(title: LocalizedStringProvider.ExercisesNames.burpee, image: StringProvider.images.hare), GridData.init(title: LocalizedStringProvider.ExercisesNames.sunSalute, image: StringProvider.images.sunMax)]

    @available(iOS 15.0, *)
    var body: some View {
        LazyHStack {
            ForEach(exerciseList) { exercise in
                MovableObject(exercise: (exercise.title, exercise.image))
                    .onDrag {
                        self.dragging = exercise
                        return NSItemProvider(object: String(exercise.id) as NSString)
                    } preview: {
                        MovableObject(exercise: (exercise.title, exercise.image))
                            .scaleEffect(0.8)
                    }
                    .onDrop(of: [UTType.text], delegate: DragRelocateDelegate(item: exercise, listData: $exerciseList, current: $dragging))
            }
        }
        .animation(.default, value: exerciseList)
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
