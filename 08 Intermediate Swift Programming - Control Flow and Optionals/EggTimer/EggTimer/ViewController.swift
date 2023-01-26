import UIKit
import AVFoundation

class ViewController: UIViewController {
    let times = ["soft": 5, "medium": 7, "hard": 12]
    var counter = 60
    var timer: Timer?
    let titleLabel: UILabel = {
        $0.text = "Чего изволите?"
        $0.textColor = .darkGray
        $0.numberOfLines = 0
        $0.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        $0.minimumScaleFactor = 12
        return $0
    }(UILabel())
    
    let softButton = UIButton(type: .system)
    let mediumButton  = UIButton(type: .system)
    let hardButton = UIButton(type: .system)
    var player: AVAudioPlayer!
    
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
            egg.config(with: title)
            egg.button.addTarget(self, action: #selector(hardnessSelected), for: .primaryActionTriggered)
            eggStack.addArrangedSubview(egg)
        }
        eggStack.axis = .horizontal
        eggStack.alignment = .fill
        eggStack.distribution = .fillEqually
        eggStack.spacing = 10
        let stack = UIStackView(arrangedSubviews: [titleLabel, eggStack])
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillEqually
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        stack.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive  = true
        stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    @objc func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle ?? ""
        if hardness == "soft" {
            print(5)
        } else if hardness == "medium" {
            print(7)
        } else {
            print(12)
        }
//        print(times[hardness] ?? 0)
//        let times = [10, 42, 72]
//        guard sender.tag >= 0 && sender.tag < times.count  else { return }
//        counter = times[sender.tag]
//        if timer != nil {
//            timer?.invalidate()
//        }
//        timer = Timer.scheduledTimer(timeInterval: 1,
//                                     target: self,
//                                     selector: #selector(updateCounter),
//                                     userInfo: nil,
//                                     repeats: true)
    }
    @objc func updateCounter() {
        if counter > 0 {
            counter -= 1
            titleLabel.text = "\(counter) seconds"
        } else {
            timer?.invalidate()
            titleLabel.text = "Ready"
            playSound()
        }
    }
}

