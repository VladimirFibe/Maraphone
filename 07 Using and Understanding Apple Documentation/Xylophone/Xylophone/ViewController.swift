import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer!
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        setupButtons()
    }
    
    func setupButtons() {
        let keys = ["C", "D", "E", "F", "G", "A", "B"]
        for i in keys.indices {
            let title = keys[i]
            let button = UIButton(type: .system)
            stackView.addArrangedSubview(button)
            var config = UIButton.Configuration.filled()
            config.cornerStyle = .medium
            config.baseBackgroundColor = UIColor(named: title)
            var attributedTitle = AttributedString(title)
            attributedTitle.font = UIFont.systemFont(ofSize: 40)
            config.attributedTitle = attributedTitle
            button.configuration = config
            button.addAction(UIAction { _ in
                self.keyPressed(button, title: title)
            }, for: .primaryActionTriggered)
            button.widthAnchor.constraint(equalTo: view.widthAnchor,
                                          multiplier: (1 - CGFloat(i + 3) * 0.035)).isActive = true
        }
    }
    
    func keyPressed(_ sender: UIButton, title: String) {
        playSound(title)
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1
        }
    }
    
    func playSound(_ title: String) {
        guard let url = Bundle.main.url(forResource: title, withExtension: "wav") else { return }
        player = try! AVAudioPlayer(contentsOf: url)
        player.play()
    }
}

