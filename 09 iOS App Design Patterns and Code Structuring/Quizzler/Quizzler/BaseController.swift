import UIKit

class BaseController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        layoutViews()
        configureAppearance()
    }
}

@objc extension BaseController {
    func setupViews() {}
    func layoutViews() {}
    func configureAppearance() {}
}
