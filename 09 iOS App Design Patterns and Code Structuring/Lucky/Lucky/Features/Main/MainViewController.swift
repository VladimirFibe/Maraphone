import UIKit

class MainViewController: UIViewController {

    @IBOutlet var answerButtons: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
    }
    
    @IBAction func answersTapped(_ sender: UIButton) {
        print(sender.titleLabel?.text)
    }
    
}
