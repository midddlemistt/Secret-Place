//
//  LevelIndicatorView.swift
//  Secret Place
//
//  Created by 123 on 22.03.24.
//

import SwiftUI

struct LevelIndicatorView: View {
    var level: Int
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 10)
                .foregroundColor(.blue)
                .opacity(0.3)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.level, 100)) / 100.0)
                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .foregroundColor(.blue)
                .rotationEffect(Angle(degrees: 270))
                .animation(.linear(duration: 1))
            
            Text("\(level)")
                .font(.system(size: 20))
                .fontWeight(.bold)
        }
        .frame(width: 80, height: 80)
    }
}
