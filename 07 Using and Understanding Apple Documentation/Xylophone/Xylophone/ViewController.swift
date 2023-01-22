import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var stackView: UIStackView!
    let keys = ["C", "D", "E", "F", "G", "A", "B"]
    override func viewDidLoad() {
        super.viewDidLoad()
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        for i in keys.indices {
            guard i < stackView.arrangedSubviews.count,
            let button = stackView.arrangedSubviews[i] as? UIButton else { return }
            let title = keys[i]
            button.backgroundColor = UIColor(named: title)
            button.setTitle(title, for: .normal)
            button.tag = i
            button.addTarget(self, action: #selector(touchKey), for: .primaryActionTriggered)
            button.widthAnchor.constraint(equalTo: view.widthAnchor,
                                          multiplier: (1 - CGFloat(i + 3) * 0.035)).isActive = true
            button.layer.cornerRadius = 20
        }
    }
    @objc func touchKey(_ sender: UIButton) {
        print(sender.tag)
    }
}

