//
//  RouteDetailView.swift
//  Secret Place
//
//  Created by 123 on 14.03.24.
//

import SwiftUI
import GoogleMaps

struct RouteDetailView: View {
    var viewModel: RouteViewModel
    @Binding var route: Route?
    var onClose: () -> Void
    var onStartRoute: () -> Void
    
    
    private let miniMapHeight: CGFloat = 250
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(spacing: 10) {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 10) {
                        if let route = route {
                            Text(route.name)
                                .font(.largeTitle)
                                .padding(.vertical, 2)
                            
                            Text(route.description)
                                .font(.subheadline)
                                .padding(.bottom, 10)
                            
                            // Оформление точек маршрута
                            ForEach(route.points, id: \.title) { point in
                                HStack {
                                    // Синий кружок напротив каждой точки маршрута
                                    Circle()
                                        .fill(Color.blue)
                                        .frame(width: 10, height: 10)
                                        .padding(.trailing, 5)
                                    
                                    VStack(alignment: .leading) {
                                        Text(point.title)
                                            .fontWeight(.bold)
                                        
                                        Text(point.description)
                                    }
                                }
                                .padding(.vertical, 2)
                            }
                            
                            MiniMapView(route: route)
                                .frame(height: miniMapHeight)
                                .cornerRadius(10)
                                .padding(.vertical)
                            
                            HStack {
                                Spacer()
                                // Кнопка "Начать маршрут"
                                // Кнопка "Начать маршрут"
                                Button(action: {
                                    viewModel.startRoute()
                                    onStartRoute()
                                }) {
                                    Text("Начать маршрут")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color.blue)
                                        .cornerRadius(10)
                                }
                                .frame(width: 200)
                                
                                Spacer()
                            }
//                            .padding(.top, 10)
                        }
                    }
                    .padding([.horizontal, .bottom])
                }
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 10)
                .padding(.top, 16) // Уменьшенный верхний отступ для ScrollView
            }
            
            // Кнопка закрытия
            Button(action: onClose) {
                Image(systemName: "xmark.circle.fill")
                    .imageScale(.large)
                    .foregroundColor(.red)
            }
            .padding(25) // Уменьшенные отступы для кнопки закрытия
        }
    }
}




//#Preview {
//    RouteDetailView(viewModel: RouteViewModel(), route: .constant(SampleData.sampleRoute), onClose: {}, onStartRoute: {})
//        .previewLayout(.sizeThatFits)
//}
