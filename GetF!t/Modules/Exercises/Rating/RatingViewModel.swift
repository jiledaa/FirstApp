import SwiftUI

class RatingViewModel: ObservableObject {
    @Published var rating = 0
    
    let maximumRating = 5
    let onColor = ColorProvider.ratings
    let offColor = Color.gray
    
//    init(exerciseIndex: Int) {
//        self.exerciseIndex = exerciseIndex
//        let desiredLength = Exercise.exercises.count
//        if ratings.count < desiredLength {
//            ratings = ratings.padding(
//                toLength: desiredLength,
//                withPad: "0",
//                startingAt: 0)
//        }
//    }

    func ratingActive(index: Int) -> Color {
        index > rating ? offColor : onColor
    }

    func updateRating(index: Int, exerciseIndex key: Int) {
        rating = index
        UserDefaults.standard.set(rating, forKey: "\(key)")
    }

    func loadRating(exerciseIndex key: Int) {
        rating = UserDefaults.standard.integer(forKey: "\(key)")
    }
}
