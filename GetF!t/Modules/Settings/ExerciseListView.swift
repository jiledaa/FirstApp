import SwiftUI

struct ExerciseListView: View {
    var exerciseList = [LocalizedStringProvider.ExercisesNames.squat, LocalizedStringProvider.ExercisesNames.stepUp, LocalizedStringProvider.ExercisesNames.burpee, LocalizedStringProvider.ExercisesNames.sunSalute]

    var body: some View {
        VStack {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 70, maximum: 100))]) {
                ForEach(0..<exerciseList.count) { index in
                    exercisesSwitch(exercise: exerciseList[index])
                }
            }
        }
        .frame(maxWidth: .infinity)
        .font(.headline)
        .padding(.horizontal)
    }

    func exercisesSwitch(exercise: LocalizedStringKey) -> some View {
        VStack {
            IndentView {
                switch exercise {
                case LocalizedStringProvider.ExercisesNames.squat:
                    ImageProvider.boltFill
                        .frame(minWidth: 60)
                case LocalizedStringProvider.ExercisesNames.stepUp:
                    ImageProvider.arrowUturnUp
                        .frame(minWidth: 60)
                case LocalizedStringProvider.ExercisesNames.burpee:
                    ImageProvider.hareFill
                        .frame(minWidth: 60)
                default:
                    ImageProvider.sunMaxFill
                        .frame(minWidth: 60)
                }
            }
            .foregroundColor(ColorProvider.gradientTop)
            .padding(.bottom)
            Text(exercise)
                .font(.caption)
                .fontWeight(.light)
                .foregroundColor(Color.primary)
        }
    }
}

struct ExerciseList_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseListView()
    }
}
