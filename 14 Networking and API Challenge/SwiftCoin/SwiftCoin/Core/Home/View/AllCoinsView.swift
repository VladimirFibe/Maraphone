//
//  AllCoinsView.swift
//  SwiftCoin
//
//  Created by Vladimir Fibe on 29.11.2022.
//

import SwiftUI

struct AllCoinsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("All Coins")
                .font(.headline)
            
            HStack {
                Text("Coin")
                Spacer()
                Text("Prices")
            }
            .font(.caption)
            .foregroundColor(.gray)
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 8.0) {
                    ForEach(0 ..< 25, id: \.self) { _ in
                        CoinsRow()
                    }
                }
            }
        }
    }
}

struct AllCoinsView_Previews: PreviewProvider {
    static var previews: some View {
        AllCoinsView()
    }
}
