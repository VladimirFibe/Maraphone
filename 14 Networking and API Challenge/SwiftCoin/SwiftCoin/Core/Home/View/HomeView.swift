import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                TopMoversView()
                
                Divider()
                
                AllCoinsView(viewModel: viewModel)
            }
            .navigationTitle("Live Prices")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
