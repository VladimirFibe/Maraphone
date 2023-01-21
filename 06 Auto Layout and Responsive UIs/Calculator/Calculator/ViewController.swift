import SwiftUI

class ViewController: UIViewController {
    
    let buttons: [[CalculatorButton]] = [
        [.ac, .plusMinus, .perecent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus]
    ]
    
    let display = UILabel()
    lazy var calculatorStack = UIStackView(arrangedSubviews: [display])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStack()
    }
    
    func setupStack() {
        display.text = "0"
        display.textAlignment = .right
        display.font = .boldSystemFont(ofSize: 60)
        calculatorStack.axis = .vertical
        calculatorStack.spacing = 8
        for row in buttons {
            let stack = buttonsStack()
            for button in row {
                stack.addArrangedSubview(addButton(button))
            }
            calculatorStack.addArrangedSubview(stack)
        }
        let stack = buttonsStack()
        stack.addArrangedSubview(addButton(.point))
        stack.addArrangedSubview(addButton(.equals))
        let stackWithZero = buttonsStack()
        stackWithZero.addArrangedSubview(addButton(.zero))
        stackWithZero.addArrangedSubview(stack)
        calculatorStack.addArrangedSubview(stackWithZero)
        view.addSubview(calculatorStack)
        calculatorStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calculatorStack.leadingAnchor.constraint(
                equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(
                equalToSystemSpacingAfter: calculatorStack.trailingAnchor, multiplier: 1),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(
                equalToSystemSpacingBelow: calculatorStack.bottomAnchor, multiplier: 1)
        ])
    }
    func buttonsStack() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 8
        return stack
    }
    private func addButton(_ button: CalculatorButton) -> UIButton {
        let uiButton = RoundCornerButton(type: .system)
        uiButton.setTitle(button.title, for: .normal)
        uiButton.backgroundColor = button.backgroundColor
        uiButton.tintColor = button.foregroundColor
        if button != .zero {
            uiButton.widthAnchor.constraint(equalTo: uiButton.heightAnchor).isActive = true
        }
        uiButton.layer.cornerRadius = 20
        uiButton.addTarget(self, action: #selector(touchDigit), for: .primaryActionTriggered)
        return uiButton
    }
    @objc func touchDigit(_ sender: UIButton) {
        print(sender.titleLabel?.text ?? "empty label")
    }
}

struct ViewControllerRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
            .ignoresSafeArea()
    }
}
