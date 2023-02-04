import SwiftUI

final class DestiniView: BaseView {
    var answerButtonPressed: ((Int) -> Void)? = nil
    let scrollView = UIScrollView()
    let storyLabel = UILabel().then {
        $0.text = "You see a fork in the road."
        $0.textColor = .white
        $0.font = .boldSystemFont(ofSize: 30)
        $0.numberOfLines = 0
    }
    
    var choiceButtons: [UIButton] = []
    
    let stack = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 20
        $0.distribution = .fill
    }
    
    func configure(with choices: [String]) {
        for index in choiceButtons.indices {
            let button = choiceButtons[index]
            if index < choices.count {
                button.setTitle(choices[index], for: .normal)
                button.isHidden = false
            } else {
                button.isHidden = true
            }
        }
    }
}

extension DestiniView {
    override func setupViews() {
        super.setupViews()
        addView(stack)
        stack.addArrangedSubview(scrollView)
        scrollView.addView(storyLabel)
        configureButtons()
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            storyLabel.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            storyLabel.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            storyLabel.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            storyLabel.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            storyLabel.widthAnchor.constraint(equalTo: stack.widthAnchor),
            
            stack.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            stack.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor,
                                           multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stack.trailingAnchor,
                                           multiplier: 2),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stack.bottomAnchor,
                                    multiplier: 2)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    }
    
    func configureButtons() {
        
        for i in 0..<2 {
            var config = UIButton.Configuration.plain()
            config.buttonSize = .medium
            config.cornerStyle = .large
            config.titleAlignment = .center
            config.titlePadding = 4.0
            config.background.backgroundColor = [UIColor.systemPurple, UIColor.systemPink][i]
            config.title = ["Take a left.", "Take a right."][i]
            config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
              var outgoing = incoming
                outgoing.font = UIFont.preferredFont(forTextStyle: .body)
              return outgoing
            }
            config.baseForegroundColor = .white
            let button = UIButton(type: .system)
            button.tag = i
            button.heightAnchor.constraint(equalToConstant: 90).isActive = true
            button.configuration = config
            button.addAction(UIAction { action in
                self.answerButtonPressed?(i)
            }, for: .primaryActionTriggered)
            choiceButtons.append(button)
            stack.addArrangedSubview(button)
        }
    }
}

