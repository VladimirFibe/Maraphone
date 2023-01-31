import SwiftUI

final class QuizzlerViewController: BaseController {
    let questionLabel = UILabel().then {
        $0.text = "Text"
        $0.textColor = .white
        $0.font = .boldSystemFont(ofSize: 30)
        $0.numberOfLines = 0
    }
    var answerButtons: [UIButton] = []
    
    let bubblesView = UIImageView(image: Res.Images.background)
    
    let progressBar = UIProgressView().then {
        $0.progressViewStyle = .bar
        $0.progress = 0.5
        $0.tintColor = Res.Color.progressTing
        $0.trackTintColor = Res.Color.trackTint
        $0.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }
    
    let quiz = [
        ["Four + Two is equal to Six", "True"],
        ["Five - Three is greater than One", "True"],
        ["Three + Eight is less than Ten", "False"]
    ]
    
    var questionNumber = 0
    
    lazy var stack = UIStackView(arrangedSubviews: [questionLabel]).then {
        $0.axis = .vertical
        $0.spacing = 20
    }
    
    func answerButtonPressed(_ action: UIAction) {
        let tag = (action.sender as? UIButton)?.tag
        let currentTitle = (action.sender as? UIButton)?.currentTitle
        let userAnswer = (action.sender as? UIButton)?.titleLabel?.text ?? "noname"
        let actualAnswer = quiz[questionNumber][1]
        print("Current Title = ", currentTitle)
        print("Tag = ", tag)
        print(userAnswer)
        if userAnswer == actualAnswer {
            print("Right!")
        } else {
            print("Wrong!")
        }
        questionNumber += 1
        if questionNumber == quiz.count  {
            questionNumber = 0
        }
        updateUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI() {
        questionLabel.text = quiz[questionNumber][0]
    }
}

extension QuizzlerViewController {
    override func setupViews() {
        super.setupViews()
        view.addView(bubblesView)
        view.addView(stack)
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            bubblesView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bubblesView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bubblesView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            stack.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor,
                                           multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stack.trailingAnchor,
                                           multiplier: 1),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: stack.bottomAnchor,
                                                             multiplier: 1)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        view.backgroundColor = Res.Color.background
        configureButtons()
        stack.addArrangedSubview(progressBar)
        
    }
    
    func configureButtons() {
        ["True", "False"].forEach {
            var config = UIButton.Configuration.plain()
            config.buttonSize = .large
            config.cornerStyle = .large
            config.titleAlignment = .center
            config.titlePadding = 4.0
            config.background.strokeColor = Res.Color.strokeColor
            config.background.strokeWidth = 4
            config.background.backgroundColor = .clear
            config.title = $0
            config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
              var outgoing = incoming
              outgoing.font = UIFont.preferredFont(forTextStyle: .largeTitle)
              return outgoing
            }
            config.baseForegroundColor = .white
            let button = UIButton(type: .system)
            button.tag = answerButtons.count
            button.configuration = config
            button.addAction(UIAction { action in
                self.answerButtonPressed(action)
            }, for: .primaryActionTriggered)
            answerButtons.append(button)
            stack.addArrangedSubview(button)
        }
    }
}

struct QuizzlerViewControllerRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        QuizzlerViewControllerRepresentable().ignoresSafeArea()
    }
}
