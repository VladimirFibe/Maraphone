import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }


    @IBAction func startTapped(_ sender: UIButton) {
        let viewController = MainViewController(nibName: "MainViewController", bundle: nil)
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true)
    }
}

