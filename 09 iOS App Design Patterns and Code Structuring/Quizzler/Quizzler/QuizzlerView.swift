import SwiftUI

final class QuizzlerView: BaseView {
    
    var answerButtonPressed: ((Int) -> Void)? = nil
    
    let questionLabel = UILabel().then {
        $0.text = "Text"
        $0.textColor = .white
        $0.font = .boldSystemFont(ofSize: 30)
        $0.numberOfLines = 0
    }
    
    var answerButtons: [UIButton] = []
    
    let progressBar = UIProgressView().then {
        $0.progressViewStyle = .bar
        $0.progress = 0.5
        $0.tintColor = Res.Color.progressTing
        $0.trackTintColor = Res.Color.trackTint
        $0.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }
    
    let stack = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 20
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
            stack.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor,
                                           multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stack.trailingAnchor,
                                           multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stack.bottomAnchor,
                                                             multiplier: 1)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    }
    
    private func setupStack() {
        stack.addArrangedSubview(questionLabel)
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
            let index = answerButtons.count
            button.tag = index
            button.configuration = config
            button.addAction(UIAction { action in
                self.answerButtonPressed?(index)
            }, for: .primaryActionTriggered)
            answerButtons.append(button)
            stack.addArrangedSubview(button)
        }
    }
}
