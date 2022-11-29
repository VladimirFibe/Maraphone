//
//  CoinsRow.swift
//  SwiftCoin
//
//  Created by Vladimir Fibe on 29.11.2022.
//

import SwiftUI

struct CoinsRow: View {
    let coin: Coin
    var body: some View {
        HStack {
            Text("\(coin.marketCapRank ?? 1)")
                .font(.caption)
                .foregroundColor(.gray)
            AsyncImage(url: URL(string: coin.image)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
            
            VStack(alignment: .leading, spacing: 4.0) {
                Text(coin.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .padding(.leading, 6)
            }
            .padding(.leading, 2)
            Spacer()
            VStack(alignment: .trailing, spacing: 4.0) {
                Text(String(format: "$%.2f", coin.currentPrice))
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text("-5.60%")
                    .font(.caption)
                    .foregroundColor(.red)
            }
            .padding(.leading, 2)
        }
    }
}
//
//struct CoinsRow_Previews: PreviewProvider {
//    static var previews: some View {
//        CoinsRow()
//            .padding(.horizontal)
//    }
//}
