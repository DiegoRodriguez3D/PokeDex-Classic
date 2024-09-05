//
//  StatsView.swift
//  PokeDex Classic
//
//  Created by Diego Rodriguez on 4/9/24.
//

import SwiftUI

struct StatsView: View {
    let stats: [PokemonStat]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(stats, id: \.stat.name) { stat in
                HStack() {
                    Text("\(stat.stat.name.capitalized)")
                        .font(.headline)
                        .foregroundStyle(.gray)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                    
                    Text("\(stat.baseStat)")
                        .font(.body)
                        .frame(width: 40, alignment: .trailing)
                    
                    Spacer()
                    
                    ProgressView(value: Float(stat.baseStat), total: 150)
                        .progressViewStyle(LinearProgressViewStyle(tint: PokemonTypeColorHelper.colorForStat(stat.stat.name)))
                        .scaleEffect(x: 1, y: 2, anchor: .center)
                        .frame(width: 150)
                }
            }
        }
    }
}
