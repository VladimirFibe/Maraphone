//
//  CoinsRow.swift
//  SwiftCoin
//
//  Created by Vladimir Fibe on 29.11.2022.
//

import SwiftUI

struct CoinsRow: View {
    var body: some View {
        HStack {
            Text("1")
                .font(.caption)
                .foregroundColor(.gray)
            Image(systemName: "bitcoinsign.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
            
            VStack(alignment: .leading, spacing: 4.0) {
                Text("Bitcoin")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                Text("BTC")
                    .font(.caption)
                    .padding(.leading, 6)
            }
            .padding(.leading, 2)
            Spacer()
            VStack(alignment: .trailing, spacing: 4.0) {
                Text("$20,330.00")
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

struct CoinsRow_Previews: PreviewProvider {
    static var previews: some View {
        CoinsRow()
            .padding(.horizontal)
    }
}
