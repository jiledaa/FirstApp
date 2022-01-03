import SwiftUI

class RatingViewModel: ObservableObject {
    @Published var rating = 0
    
    let maximumRating = 5

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

    func ratingActive(_ index: Int) -> Bool {
        index > self.rating
    }

    func updateRating(index: Int) {
        rating = index
    }
}
