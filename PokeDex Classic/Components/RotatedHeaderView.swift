//
//  RotatedHeaderView.swift
//  PokeDex Classic
//
//  Created by Diego Rodriguez on 4/9/24.
//

import SwiftUI

struct RotatedHeaderView: View {
    var color: Color = .red
    var rotationDegrees: Double = -20

    var body: some View {
        GeometryReader { geometry in
            Rectangle()
                .fill(color)
                .rotationEffect(Angle(degrees: rotationDegrees), anchor: .center)
                .edgesIgnoringSafeArea(.all)
                .frame(width: geometry.size.width * 1.5, height: geometry.size.height * 1.1)
                .offset(x: -geometry.size.width * 0.55, y: -geometry.size.height * 0.85)
        }
    }
}

#Preview {
    RotatedHeaderView()
}
