import Foundation

final class HomeViewModel: ObservableObject {
    @Published var coins: [Coin] = []
    
    init() {
        fetchCoinData()
    }
    
    func fetchCoinData() {
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=50&page=1&sparkline=true&price_change_percentage=24h"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                print("DEBUG: Error \(error.localizedDescription)")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("DEBUG: Error \(response.statusCode)")
            }
            
            guard let data else { return }
            let dataAsString = String(data: data, encoding: .utf8) ?? ""
            print("DEBUG: \(dataAsString)")
            
            do {
                let coins: [Coin] = try JSONDecoder().decode([Coin].self, from: data)
                self.coins = coins
            } catch let error {
                print("DEBUG: \(error.localizedDescription)")
            }
        }.resume()
    }
}
    
