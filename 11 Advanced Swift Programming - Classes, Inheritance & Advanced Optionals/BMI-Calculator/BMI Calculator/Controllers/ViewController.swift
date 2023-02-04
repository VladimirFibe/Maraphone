import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        print(String(format: "Height: %.2fm", sender.value))
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        print(String(format: "Weight: %.0fKg", sender.value))
    }
}

