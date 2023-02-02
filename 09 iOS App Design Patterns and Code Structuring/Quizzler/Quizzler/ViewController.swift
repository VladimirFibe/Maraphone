import SwiftUI

class ViewController: BaseController {
    let quizzlerView = QuizzlerView()
    let bubblesView = UIImageView(image: Res.Images.background)
    
    lazy var questionLabel = quizzlerView.questionLabel
    lazy var progressBar = quizzlerView.progressBar
    
    let quiz = [
        Question(text: "Four + Two is equal to Six", answer: 0),
        Question(text: "Five - Three is greater than One", answer: 0),
        Question(text: "Three + Eight is less than Ten", answer: 1)
    ]
    
    var questionNumber = 0 {
        didSet {
            if questionNumber == quiz.count {
                questionNumber = 0
            }
            updateUI()
        }
    }
    
    func answerButtonPressed(_ index: Int) {
        let actualAnswer = quiz[questionNumber].answer
        print(questionNumber)
        if index == actualAnswer {
            print("Right")
        } else {
            print("Wrong")
        }
        questionNumber += 1
    }
    
    func updateUI() {
        print("DEBUG: \(#function)")
        questionLabel.text = quiz[questionNumber].text
    }
}

extension ViewController {
    override func setupViews() {
        super.setupViews()
        view.addView(bubblesView)
        view.addView(quizzlerView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            bubblesView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bubblesView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bubblesView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            quizzlerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            quizzlerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            quizzlerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            quizzlerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        view.backgroundColor = Res.Color.background
        questionNumber = 0
        quizzlerView.answerButtonPressed = answerButtonPressed
    }
}

struct ViewControllerRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
            .ignoresSafeArea()
    }
}
