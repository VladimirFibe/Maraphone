import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightLabel.text = String(format: "%.2fm", sender.value)
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightLabel.text = String(format: "%.0fKg", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            guard  let viewController = segue.destination as? ResultViewController else { return }
            let height = heightSlider.value
            let weight = weightSlider.value
            let bmi = weight / (height * height)
            viewController.value = String(format: "%.0f", bmi)
        }
    }
}

