import SwiftUI

class ViewController: BaseController {
    let destiniView = DestiniView()
    
    lazy var storyLabel = destiniView.storyLabel
    lazy var choiceButton = destiniView.choiceButtons
    
    let backgroundView = UIImageView(image: UIImage(named: "background")).then {
        $0.contentMode = .scaleToFill
    }
}

extension ViewController {
    override func setupViews() {
        super.setupViews()
        view.addView(backgroundView)
        view.addView(destiniView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            destiniView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            destiniView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            destiniView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            destiniView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    }
}

