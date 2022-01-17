import SwiftUI
import UniformTypeIdentifiers

struct ExerciseListView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @State var dragging: ExerciseData?
    @State var exerciseList = [ExerciseData.init(title: LocalizedStringProvider.ExercisesNames.squat, image: StringProvider.images.bolt), ExerciseData.init(title: LocalizedStringProvider.ExercisesNames.stepUp, image: StringProvider.images.arrow), ExerciseData.init(title: LocalizedStringProvider.ExercisesNames.burpee, image: StringProvider.images.hare), ExerciseData.init(title: LocalizedStringProvider.ExercisesNames.sunSalute, image: StringProvider.images.sunMax)]

    var body: some View {
        LazyHStack {
            ForEach(exerciseList) { exercise in
                MovableObject(exercise: (exercise.title, exercise.image))
                    .onDrag {
//                        navigationManager.getIndexForSelectedTab(exerciseList: exerciseList)
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
        ExerciseListView(navigationManager: .init())
    }
}
