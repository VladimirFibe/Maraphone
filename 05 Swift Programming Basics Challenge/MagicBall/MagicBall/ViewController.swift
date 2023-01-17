import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer?

    let answers = [#imageLiteral(resourceName: "ball1"), #imageLiteral(resourceName: "ball2"), #imageLiteral(resourceName: "ball3"), #imageLiteral(resourceName: "ball4"), #imageLiteral(resourceName: "ball5")]
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var askButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = answers.randomElement()
        view.backgroundColor = .systemBlue
        askButton.backgroundColor = .white
        player?.numberOfLoops = -1
        playSound()
    }


    @IBAction func askButtonTapped(_ sender: UIButton) {
        imageView.image = answers.randomElement()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
      if motion == .motionShake {
          imageView.image = answers.randomElement()
      }
    }
    
    func playSound() {
        guard let path = Bundle.main.path(forResource: "background", ofType:"mp3") else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

