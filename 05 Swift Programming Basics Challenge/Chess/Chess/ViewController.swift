//
//  ViewController.swift
//  Chess
//
//  Created by Vladimir Fibe on 12/18/22.
//

import UIKit

class ViewController: UIViewController {

    let letters = ["a": 0, "b": 1, "c": 2, "d": 3, "e": 4, "f": 5, "g": 6, "h": 7]
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var moveButton: UIButton!
    @IBOutlet var pieces: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func moveTapped(_ sender: UIButton) {
        guard let words = textField.text?.split(separator: "-"),
        words.count == 2 else { return }
        let fromIndex = strToIndex(String(words[0]))
        let toIndex = strToIndex(String(words[1]))
        if pieces[fromIndex].image != nil && pieces[toIndex].image == nil {
            pieces[toIndex].image = pieces[fromIndex].image
            pieces[fromIndex].image = nil
            textField.text = ""
        }
    }
    
    func strToIndex(_ text: String) -> Int {
        let char = String(text.first ?? "a")
        let digit = String(text.last ?? "1")
        return (Int(digit)! - 1) * 8 + letters[char]!
    }
}

