import SwiftUI

class ViewController: BaseController {
    var quizzler = Quizzler() { didSet { updateUI() }}
    let quizzlerView = QuizzlerView()
    let bubblesView = UIImageView(image: Res.Images.background)
    
    lazy var scoreLabel = quizzlerView.scoreLabel
    lazy var questionLabel = quizzlerView.questionLabel
    lazy var progressBar = quizzlerView.progressBar
    lazy var answerButtons = quizzlerView.answerButtons
    
    func answerButtonPressed(_ index: Int) {
        if quizzler.checkAnswer(index) {
            answerButtons[index].configuration?.background.backgroundColor = .green
        } else {
            answerButtons[index].configuration?.background.backgroundColor = .red
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.answerButtons[index].configuration?.background.backgroundColor = .clear
            self.quizzler.nextQuestion()
        }
    }
    
    func updateUI() {
        scoreLabel.text = "Score: \(quizzler.currentScore)"
        questionLabel.text = quizzler.currentQuestion
        progressBar.progress = quizzler.currentProgress
        quizzlerView.configure(with: quizzler.currentAnswers)
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
        quizzlerView.answerButtonPressed = answerButtonPressed
        updateUI()
    }
}

struct ViewControllerRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
            .ignoresSafeArea()
    }
}

