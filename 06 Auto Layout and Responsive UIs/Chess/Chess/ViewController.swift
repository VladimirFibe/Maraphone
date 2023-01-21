import UIKit

class ViewController: UIViewController {
    @IBOutlet var pieces: [UIImageView]!
    var pointFrom: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        for i in 0..<64 {
            pieces[i].tag = i
            pieces[i].addGestureRecognizer(UITapGestureRecognizer(
                target: self,
                action: #selector(handleTap)))
            pieces[i].isUserInteractionEnabled = true
            pieces[i].layer.borderWidth = 4
            pieces[i].layer.borderColor = UIColor.clear.cgColor
        }
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        guard let pointTo = sender.view?.tag else { return }
        if let pointFrom = pointFrom {
            if pointFrom != pointTo {
                pieces[pointTo].image = pieces[pointFrom].image
                pieces[pointFrom].image = nil
            }
            pieces[pointFrom].layer.borderColor = UIColor.clear.cgColor
            self.pointFrom = nil
        } else if pieces[pointTo].image != nil {
            pointFrom = pointTo
            pieces[pointTo].layer.borderColor = UIColor.black.cgColor
        }
    }
}

