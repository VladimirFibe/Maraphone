import UIKit

class ViewController: UIViewController {

    let answers = [#imageLiteral(resourceName: "ball1"), #imageLiteral(resourceName: "ball2"), #imageLiteral(resourceName: "ball3"), #imageLiteral(resourceName: "ball4"), #imageLiteral(resourceName: "ball5")]
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var askButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = answers.randomElement()
        view.backgroundColor = .systemBlue
        askButton.backgroundColor = .white
    }


    @IBAction func askButtonTapped(_ sender: UIButton) {
        imageView.image = answers.randomElement()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
      if motion == .motionShake {
          imageView.image = answers.randomElement()
      }
    }
}

