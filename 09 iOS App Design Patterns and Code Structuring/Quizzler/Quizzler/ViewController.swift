import UIKit

class ViewController: BaseController {
    
}

extension ViewController {
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = .red
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    }
}
