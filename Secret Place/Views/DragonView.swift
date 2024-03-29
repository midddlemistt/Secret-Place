//
//  DragonView.swift
//  Secret Place
//
//  Created by 123 on 19.03.24.
//
import SwiftUI

struct DragonView: View {
    var body: some View {
        ZStack {
            // Голова дракона
            Circle()
                .fill(Color.red)
                .frame(width: 200, height: 200)
            
            // Глаза дракона
            HStack(spacing: 120) {
                EyeView()
                EyeView()
            }
            
            // Нос и рот дракона
            Path { path in
                path.move(to: CGPoint(x: 150, y: 300))
                path.addQuadCurve(to: CGPoint(x: 250, y: 300), control: CGPoint(x: 200, y: 350))
            }
            .stroke(Color.black, lineWidth: 2)
        }
    }
}

struct EyeView: View {
    var body: some View {
        ZStack {
            Circle().fill(Color.white).frame(width: 30, height: 30) // Белок глаза
            Circle().fill(Color.black).frame(width: 15, height: 15) // Зрачок
        }
    }
}


#Preview {
    DragonView()
}

