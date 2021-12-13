import Foundation
import SwiftUI

struct RatingModelView {
    let exerciseIndex: Int
    @AppStorage(LocalizedStringProvider.ratingsString) private var ratings = ""
    @State private var rating = 0
    let maximumRating = 5

    let onColor = Color(LocalizedStringProvider.ratingsString)
    let offColor = Color.gray

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

    fileprivate func convertRating() {
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
