import SwiftUI

class ViewController: BaseController {
    var storyBrain = StoryBrain() {
        didSet {
            updateUI()
        }
    }
    let destiniView = DestiniView()
    
    lazy var storyLabel = destiniView.storyLabel
    lazy var choiceButton = destiniView.choiceButtons
    
    let backgroundView = UIImageView(image: UIImage(named: "background")).then {
        $0.contentMode = .scaleToFill
    }
    
    func answerButtonPressed(_ index: Int) {
        storyBrain.nextStory(index)
    }
    
    func updateUI() {
        storyLabel.text = storyBrain.currentTitle
        destiniView.configure(with: storyBrain.currentChoices)
    }
    
}

extension ViewController {
    override func setupViews() {
        super.setupViews()
        view.addView(backgroundView)
        view.addView(destiniView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            destiniView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            destiniView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            destiniView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            destiniView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        destiniView.answerButtonPressed = answerButtonPressed
        updateUI()
    }
}

struct ViewControllerRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
            .ignoresSafeArea()
    }
}
