//
//  DragonHutView.swift
//  Secret Place
//
//  Created by 123 on 16.03.24.
//

import SwiftUI

struct DragonHutView: View {
    @StateObject var viewModel = DragonHutViewModel()

    var body: some View {
        VStack(spacing: 40) {
            
            Text(viewModel.dragon.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            // Индикаторы состояния дракона с кнопками
            HStack(spacing: 30) {
                VStack {
                    CircleIndicatorView(label: "Счастье", systemImageName: "heart.fill", level: viewModel.dragon.happiness)
                    Button(action: {
                        viewModel.playWithDragon()
                    }) {
                        ActionButtonView(label: "Играть", systemImageName: "gamecontroller.fill")
                    }
                }

                VStack {
                    CircleIndicatorView(label: "Сытость", systemImageName: "fork.knife", level: viewModel.dragon.fullness)
                    Button(action: {
                        viewModel.feedDragon()
                    }) {
                        ActionButtonView(label: "Кормить", systemImageName: "fork.knife")
                    }
                }
                
                VStack {
                    CircleIndicatorView(label: "Энергия", systemImageName: "bolt.fill", level: viewModel.dragon.energy)
                    Button(action: {
                        viewModel.letDragonSleep()
                    }) {
                        ActionButtonView(label: "Спать", systemImageName: "moon.zzz.fill")
                    }
                }
            }
        }
        .padding()
    }
}

struct ActionButtonView: View {
    let label: String
    let systemImageName: String

    var body: some View {
        Label(label, systemImage: systemImageName)
            .labelStyle(IconOnlyLabelStyle())
            .frame(width: 80, height: 80)
            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .foregroundColor(.white)
            .clipShape(Circle())
            .shadow(radius: 5)
    }
}


// Простой компонент индикатора прогресса
struct ProgressBar: View {
    @Binding var value: Int

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width, height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color.gray)

                Rectangle().frame(width: min(CGFloat(self.value) * geometry.size.width / 100, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color.blue)
                    .animation(.linear)
            }.cornerRadius(45.0)
        }
    }
}


struct CircleIndicatorView: View {
    var label: String
    var systemImageName: String
    var level: Int

    private var fillColor: Color {
        switch level {
        case ...33:
            return .red
        case 34...66:
            return .yellow
        default:
            return .green
        }
    }

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(lineWidth: 10.0)
                    .opacity(0.3)
                    .foregroundColor(fillColor)
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(self.level, 100)) / 100)
                    .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(fillColor)
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.linear)

                Image(systemName: systemImageName)
                    .frame(width: 50, height: 50, alignment: .center)
            }
            .frame(width: 100, height: 100)

            Text(label)
        }
    }
}

 
#Preview {
    DragonHutView()
}
