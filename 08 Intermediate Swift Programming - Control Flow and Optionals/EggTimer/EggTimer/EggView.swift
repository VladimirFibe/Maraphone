import UIKit

final class EggView: UIView {
    let imageView: UIImageView = {
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    } (UIImageView())
    
    let button: UIButton = {
        var config = UIButton.Configuration.plain()
        $0.configuration = config
        $0.tintColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    } (UIButton(type: .system))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(imageView)
        addSubview(button)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            button.topAnchor.constraint(equalTo: topAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func config(_ target: Any?, action: Selector, with title: String) {
        var attributedTitle = AttributedString(title.capitalized)
        attributedTitle.font = UIFont.systemFont(ofSize: 18, weight: .black)
        button.configuration?.attributedTitle = attributedTitle
        imageView.image = UIImage(named: title)
        button.addTarget(target, action: action, for: .primaryActionTriggered)
    }
}
