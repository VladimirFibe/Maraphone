import SwiftUI

struct QuizzlerViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> QuizzlerViewController {
        QuizzlerViewController()
    }
    func updateUIViewController(_ uiViewController: QuizzlerViewController, context: Context) {
    }
}
