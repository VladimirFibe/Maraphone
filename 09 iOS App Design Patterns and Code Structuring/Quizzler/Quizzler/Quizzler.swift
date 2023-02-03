import Foundation

struct Quizzler {
    var quiz = Question.questions()

    private var score = 0
    private var questionNumber = 0
    
    var currentQuestion: String {
        quiz[questionNumber].text
    }
    
    var currentProgress: Float {
        quiz.isEmpty ? 1 : (Float(questionNumber + 1)) / Float(quiz.count)
    }
    
    var currentScore: Int {
        score
    }
    
    var currentAnswers: [String] {
        quiz[questionNumber].answers
    }
    
    mutating func checkAnswer(_ index: Int) -> Bool {
        if quiz[questionNumber].answer == index {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    mutating func nextQuestion() {
        if questionNumber < quiz.count - 1 {
            questionNumber += 1
        } else {
            reset()
        }
    }
    
    mutating func reset() {
        score = 0
        questionNumber = 0
    }
    
    
}
