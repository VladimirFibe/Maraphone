import SwiftUI

class ViewController: BaseController {
    let quizzlerView = QuizzlerView()
    let bubblesView = UIImageView(image: Res.Images.background)
    
    lazy var questionLabel = quizzlerView.questionLabel
    lazy var progressBar = quizzlerView.progressBar
    lazy var answerButtons = quizzlerView.answerButtons
    
    let quiz = Question.fetch()

    
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
        if index == actualAnswer {
            answerButtons[index].configuration?.background.backgroundColor = .green
        } else {
            answerButtons[index].configuration?.background.backgroundColor = .red
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.answerButtons[index].configuration?.background.backgroundColor = .clear
            self.questionNumber += 1
        }
    }
    
    func updateUI() {
        questionLabel.text = quiz[questionNumber].text
        progressBar.progress = (Float(questionNumber + 1)) / Float(quiz.count)
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
