import SwiftUI

final class QuizzlerView: BaseView {
    
    var answerButtonPressed: ((Int) -> Void)? = nil
    
    let questionLabel = UILabel().then {
        $0.text = "Text"
        $0.textColor = .white
        $0.font = .boldSystemFont(ofSize: 30)
        $0.numberOfLines = 0
    }
    
    let scoreLabel = UILabel().then {
        $0.text = "Text"
        $0.textColor = .white
        $0.font = .boldSystemFont(ofSize: 30)
        $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        $0.numberOfLines = 1
    }
    
    var answerButtons: [UIButton] = []
    
    let progressBar = UIProgressView().then {
        $0.progressViewStyle = .bar
        $0.progress = 0.5
        $0.tintColor = Res.Color.progressTing
        $0.trackTintColor = Res.Color.trackTint
        $0.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }
    
    let view = UIView()

    let stack = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 20
        $0.distribution = .fill
    }
    
    func configure(with answers: [String]) {
        for index in answerButtons.indices {
            let button = answerButtons[index]
            if index < answers.count {
                button.setTitle(answers[index], for: .normal)
                button.isHidden = false
            } else {
                button.isHidden = true
            }
        }
    }
}

extension QuizzlerView {
    override func setupViews() {
        super.setupViews()
        addView(stack)
        setupStack()
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            stack.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor,
                                           multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stack.trailingAnchor,
                                           multiplier: 2),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stack.bottomAnchor,
                                    multiplier: 2),
            questionLabel.topAnchor.constraint(equalTo: view.topAnchor),
            questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            questionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    }
    
    private func setupStack() {
        stack.addArrangedSubview(scoreLabel)
        view.addView(questionLabel)
        stack.addArrangedSubview(view)
        configureButtons()
        stack.addArrangedSubview(progressBar)
    }
    
    func configureButtons() {
        for i in 0..<3 {
            var config = UIButton.Configuration.plain()
            config.buttonSize = .medium
            config.cornerStyle = .large
            config.titleAlignment = .center
            config.titlePadding = 4.0
            config.background.strokeColor = Res.Color.strokeColor
            config.background.strokeWidth = 4
            config.background.backgroundColor = .clear
            config.title = "Answer"
            config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
              var outgoing = incoming
              outgoing.font = UIFont.preferredFont(forTextStyle: .title1)
              return outgoing
            }
            config.baseForegroundColor = .white
            let button = UIButton(type: .system)
            button.tag = i
            button.heightAnchor.constraint(equalToConstant: 70).isActive = true
            button.configuration = config
            button.addAction(UIAction { action in
                self.answerButtonPressed?(i)
            }, for: .primaryActionTriggered)
            answerButtons.append(button)
            stack.addArrangedSubview(button)
        }
    }
}
