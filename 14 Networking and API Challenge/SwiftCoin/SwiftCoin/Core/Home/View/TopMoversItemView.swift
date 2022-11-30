//
//  TopMoversItemView.swift
//  SwiftCoin
//
//  Created by Vladimir Fibe on 29.11.2022.
//

import SwiftUI

struct TopMoversItemView: View {
    let coin: Coin
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            AsyncImage(url: URL(string: coin.image)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
                .scaledToFit()
                .frame(width: 32, height: 32)

            HStack(spacing: 2.0) {
                Text(coin.symbol.uppercased())
                    .fontWeight(.bold)
                Text(coin.currentPrice.toCurrency())
                    .foregroundColor(.gray)
            }
            .font(.caption)
            Text(coin.priceChangePercentage24H.toPercent())
                .font(.title2)
                .foregroundColor(coin.priceChangePercentage24H > 0 ? Color(.systemGreen) : Color(.systemRed))
        }
        .frame(width: 140, height: 140)
        .background(Color("ItemBackgroundColor"))
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.systemGray4), lineWidth: 2))
    }
}
//
//struct TopMoversItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopMoversItemView()
//    }
//}
