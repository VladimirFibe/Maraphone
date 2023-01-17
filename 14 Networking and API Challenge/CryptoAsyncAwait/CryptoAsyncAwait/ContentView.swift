import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    @State private var showAlert = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.coins) { coin in
                    CoinRowView(coin: coin)
                        .onAppear {
                            if coin.id == viewModel.coins.last?.id {
                                print(viewModel.urlString)
                                viewModel.loadData()
                            }
                        }
                }
            }
            .refreshable {
                viewModel.loadData()
            }
            .onReceive(viewModel.$error, perform: { error in
                if error != nil { showAlert.toggle() }
            })
            .navigationTitle("Live Prices")
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"),
                  message: Text(viewModel.error?.localizedDescription ?? ""))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
