import SwiftUI

struct QuizzlerViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> QuizzlerView {
        QuizzlerView()
    }
    
    func updateUIView(_ uiView: QuizzlerView, context: Context) {
    }
}

struct QuizzlerViewRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        QuizzlerViewRepresentable()
    }
}
