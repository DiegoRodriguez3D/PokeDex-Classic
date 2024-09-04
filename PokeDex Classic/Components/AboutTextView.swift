//
//  AboutTextView.swift
//  PokeDex Classic
//
//  Created by Diego Rodriguez on 4/9/24.
//

import SwiftUI

struct AboutTextView: View {
    var height: String
    var weight: String
    var abilities: String
    var baseExp: String
    
    var body: some View {
        HStack {
            
            VStack(alignment: .leading, spacing: 30) {
                Text("Height")
                    .font(.headline)
                    .foregroundStyle(.gray)
                
                Text("Weight")
                    .font(.headline)
                    .foregroundStyle(.gray)
                
                Text("Abilities")
                    .font(.headline)
                    .foregroundStyle(.gray)
                
                Text("Base Exp")
                    .font(.headline)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            VStack (alignment: .leading, spacing: 30) {
                Text(height)
                    .font(.body)
                
                Text(weight)
                    .font(.body)
                
                Text(abilities)
                    .font(.body)
                
                Text(baseExp)
                    .font(.body)
            }
        }
    }
}

#Preview {
    AboutTextView(height: "20 cm", weight: "20 kg", abilities: "Overegrow, Chlorophyll", baseExp: "263 exp")
}
