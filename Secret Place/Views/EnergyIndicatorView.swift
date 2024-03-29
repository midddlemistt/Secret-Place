//
//  EnergyIndicatorView.swift
//  Secret Place
//
//  Created by 123 on 22.03.24.
//

import SwiftUI

struct EnergyIndicatorView: View {
    var energy: Int
    var maxValue: Int
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 10)
                .foregroundColor(.yellow)
                .opacity(0.3)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.energy, maxValue)) / CGFloat(maxValue))
                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .foregroundColor(.yellow)
                .rotationEffect(Angle(degrees: 270))
                .animation(.linear(duration: 1))
            
            Image(systemName: "bolt.fill")
                .foregroundColor(.yellow)
                .scaleEffect(1.5)
        }
        .frame(width: 80, height: 80)
    }
}
