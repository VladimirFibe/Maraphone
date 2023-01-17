import UIKit

class ViewController: UIViewController {

    let diceImages = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    @IBOutlet var dice: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dice[0].image = #imageLiteral(resourceName: "DiceSix")
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        dice[0].image = diceImages.randomElement()
        dice[1].image = diceImages.randomElement()
    }
}

