import UIKit

class ViewController: UIViewController {

    let letters = ["a": 0, "b": 1, "c": 2, "d": 3, "e": 4, "f": 5, "g": 6, "h": 7]
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet var pieces: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func moveTapped(_ sender: UIButton) {
        var fromIndex: Int
        var toIndex: Int
        if textField.text == "" {
            var indexSet: Set<Int> = []
            for i in 0..<64 {
                if pieces[i].image != nil {
                    indexSet.insert(i)
                }
            }
            fromIndex = indexSet.randomElement() ?? 0
            toIndex = Int.random(in: 0..<64)
        } else {
            guard let words = textField.text?.split(separator: "-"),
                  words.count == 2 else { return }
            fromIndex = strToIndex(String(words[0])) ?? 0
            toIndex = strToIndex(String(words[1])) ?? 63
        }
        if pieces[fromIndex].image != nil {
            pieces[toIndex].image = pieces[fromIndex].image
            pieces[fromIndex].image = nil
            textField.text = ""
        }
    }
    
    func strToIndex(_ text: String) -> Int? {
        let char = String(text.first ?? "a")
        let digit = String(text.last ?? "1")
        guard let y = letters[char] else { return nil }
        guard let x = Int(digit), x < 9, x > 0  else { return nil }
        return (x - 1) * 8 + y
    }
}

