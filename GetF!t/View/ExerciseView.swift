import SwiftUI
import AVKit

struct ExerciseView: View {
    @EnvironmentObject var history: HistoryStore
    @State private var showHistory = false
    @State private var showSuccess = false
    @Binding var selectedTab: Int
    let index: Int
    @State private var timerDone = false
    @State private var showTimer = false
    
    var lastExercise: Bool {
        index + 1 == Exercise.exercises.count
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    HeaderView(
                        selectedTab: $selectedTab,
                        titleText: Exercise.exercises[index].exerciseName)
                        .padding(.bottom)
                    if let url = Bundle.main.url(
                        forResource: Exercise.exercises[index].videoName,
                        withExtension: "mp4") {
                        VideoPlayer(player: AVPlayer(url: url))
                            .frame(height: geometry.size.height * 0.45)
                    } else {
                        Text(NSLocalizedString("Couldn't find \(Exercise.exercises[index].videoName).mp4", comment: "message"))
                            .foregroundColor(.red)
                    }
                    
                    HStack(spacing: 150) {
                        RaisedButton(buttonText: NSLocalizedString("Get started", comment: "Starten!")) {
                            showTimer.toggle()
                        }
                        .font(.custom("StartStop", size: 30))
                        .padding()
                        RaisedButton(buttonText: NSLocalizedString("Done", comment: "DoneButton")) {
                            history.addDoneExercise(Exercise.exercises[index].exerciseName)
                            timerDone = false
                            showTimer.toggle()
                            if lastExercise {
                                showSuccess.toggle()
                            } else {
                                selectedTab += 1
                            }
                        }
                        .disabled(!timerDone)
                        .sheet(isPresented: $showSuccess) {
                            SuccessView(selectedTab: $selectedTab)
                        }
                    }
                    .font(.custom("StartStop", size: 30))
                    .padding()
                    if showTimer {
                        TimerView(timerDone: $timerDone)
                    }
                    
                    Spacer()
                    RatingView(exerciseIndex: index)
                        .padding()
                    Button(
                        action: {
                            showHistory = true
                        }, label: {
                            Text(NSLocalizedString("History", comment: "History"))
                                .fontWeight(.bold)
                                .padding([.leading, .trailing], 5)
                        })
                        .padding(.bottom)
                        .buttonStyle(EmbossedButtonStyle())
                        .sheet(isPresented: $showHistory) {
                            HistoryView(showHistory: $showHistory)
                        }
                        .padding(.bottom)
                        .buttonStyle(EmbossedButtonStyle())
                    
                }
            }
        }
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(selectedTab: .constant(0), index: 0)
            .environmentObject(HistoryStore())
    }
}


