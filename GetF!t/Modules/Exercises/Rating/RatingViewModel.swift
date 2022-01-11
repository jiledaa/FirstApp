import SwiftUI

class RatingViewModel: ObservableObject {
    @Published var rating = 0
    
    var exercise: Exercise?
    let maximumRating = 5

    let onColor = ColorProvider.ratings
    let offColor = Color.gray
    
    func ratingActive(_ index: Int) -> Bool {
        index > rating
    }

    func updateRating(index: Int) {
        rating = index
        guard let key = exercise?.exerciseName else {
            return
        }
        UserDefaults.standard.set(rating, forKey: "\(key)")
        print("sejf\(rating)")
    }

    func loadRating(exercise: Exercise) {
        self.exercise = exercise
        rating = UserDefaults.standard.integer(forKey: "\(exercise.exerciseName)")
        print("loud\(rating)")
    }
}
