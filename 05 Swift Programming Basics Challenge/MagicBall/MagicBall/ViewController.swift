import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer?

    let image = #imageLiteral(resourceName: "Ball_1")
    let answers = [#imageLiteral(resourceName: "Ball_2"), #imageLiteral(resourceName: "Ball_3"), #imageLiteral(resourceName: "Ball_4"), #imageLiteral(resourceName: "Ball_5"), #imageLiteral(resourceName: "Ball_6"), #imageLiteral(resourceName: "Ball_7")]
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var askButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
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

