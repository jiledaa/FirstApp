import Foundation
import SwiftUI

class RatingViewModel: ObservableObject {
    @AppStorage(StringProvider.ratingsString) private var ratings = ""
    @State private var rating = 0
    
    let maximumRating = 5
    let exerciseIndex: Int

    init(exerciseIndex: Int) {
        self.exerciseIndex = exerciseIndex
        let desiredLength = Exercise.exercises.count
        if ratings.count < desiredLength {
            ratings = ratings.padding(
                toLength: desiredLength,
                withPad: "0",
                startingAt: 0)
        }
    }

    func ratingActive(_ index: Int) -> Bool {
        index > self.rating
    }

    func convertRating() {
        let index = ratings.index(
            ratings.startIndex,
            offsetBy: exerciseIndex)
        let character = ratings[index]
        rating = character.wholeNumberValue ?? 0
    }

    func updateRating(index: Int) {
        rating = index
        let index = ratings.index(
            ratings.startIndex,
            offsetBy: exerciseIndex)
        ratings.replaceSubrange(index...index, with: String(rating))
    }
}
