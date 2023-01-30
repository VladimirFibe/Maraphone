import UIKit
import AVFoundation

class ViewController: UIViewController {
    let eggTimes: [String: Float] = ["Soft": 5.0, "Medium": 7.0, "Hard": 12.0]
    var totalTime: Float = 50.0
    var secondPassed: Float = 0.0
    var timer: Timer?
    var player: AVAudioPlayer!
    
    let titleLabel: UILabel = {
        $0.text = "Чего изволите?"
        $0.textColor = .darkGray
        $0.numberOfLines = 0
        $0.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        $0.minimumScaleFactor = 12
        return $0
    }(UILabel())
    
    let progressBar: UIProgressView = {
        $0.trackTintColor = .gray
        $0.progressTintColor = .yellow
        $0.backgroundColor = .gray
        $0.progress = 0.0
        return $0
    }(UIProgressView(progressViewStyle: .bar))
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm", withExtension: "mp3") else { return }
        player = try! AVAudioPlayer(contentsOf: url)
        player.play()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        let eggStack = UIStackView()
        view.backgroundColor = #colorLiteral(red: 0.7960784314, green: 0.9490196078, blue: 0.9882352941, alpha: 1) // CBF2FC
        let titles = ["soft", "medium", "hard"]
        for title in titles {
            let egg = EggView()
            egg.config(self, action: #selector(hardnessSelected), with: title)
            eggStack.addArrangedSubview(egg)
        }
        eggStack.axis = .horizontal
        eggStack.alignment = .fill
        eggStack.distribution = .fillEqually
        eggStack.spacing = 10
        let progressContainer = UIView()
        let stack = UIStackView(arrangedSubviews: [titleLabel, eggStack, progressContainer])
        view.addSubview(stack)
        progressContainer.addSubview(progressBar)
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillEqually
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        progressContainer.translatesAutoresizingMaskIntoConstraints = false
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            stack.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            progressBar.heightAnchor.constraint(equalToConstant: 5.0),
            progressBar.centerYAnchor.constraint(equalTo: progressContainer.centerYAnchor),
            progressBar.leadingAnchor.constraint(equalTo: progressContainer.leadingAnchor),
            progressBar.trailingAnchor.constraint(equalTo: progressContainer.trailingAnchor),
            progressContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        ])
    }
    
    @objc func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.titleLabel?.text ?? ""
        guard let value = eggTimes[hardness] else { return }
        totalTime = value
        secondPassed = 0
        if timer != nil {
            timer?.invalidate()
        }
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(updateCounter),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc func updateCounter() {
        if secondPassed < totalTime - 1 {
            secondPassed += 1
            progressBar.progress = secondPassed / totalTime
            titleLabel.text = String(format: "%.0f seconds", (totalTime - secondPassed))
        } else {
            timer?.invalidate()
            titleLabel.text = "Ready"
            progressBar.progress = 1.0
            playSound()
        }
    }
}

