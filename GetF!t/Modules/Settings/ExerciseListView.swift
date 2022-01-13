import SwiftUI

struct ExerciseListView: View {
    @State private var draggedOfset = CGSize.zero

    var exerciseList = [LocalizedStringProvider.ExercisesNames.squat, LocalizedStringProvider.ExercisesNames.stepUp, LocalizedStringProvider.ExercisesNames.burpee, LocalizedStringProvider.ExercisesNames.sunSalute]

    var imageList = [StringProvider.images.bolt, StringProvider.images.arrow, StringProvider.images.hare, StringProvider.images.sunMax]

    var body: some View {
        HStack {
            ForEach(0..<exerciseList.count) { index in
                MovableObject(imageName: imageList[index], exercise: exerciseList[index])
            }
        }
        .frame(maxWidth: .infinity)
        .font(.headline)
        .padding(.horizontal)
    }
}

struct ExerciseList_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseListView()
    }
}
