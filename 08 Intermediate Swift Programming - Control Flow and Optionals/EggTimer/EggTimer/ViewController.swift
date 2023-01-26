import UIKit
import AVFoundation

class ViewController: UIViewController {
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
        let times = [10, 42, 72]
        guard sender.tag >= 0 && sender.tag < times.count  else { return }
        counter = times[sender.tag]
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

final class EggView: UIView {
    let imageView = UIImageView()
    let button = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(imageView)
        addSubview(button)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            button.topAnchor.constraint(equalTo: topAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func config(with title: String) {
        button.setTitle(title, for: .normal)
        imageView.image = UIImage(named: title)
        imageView.contentMode = .scaleAspectFit
    }
}
