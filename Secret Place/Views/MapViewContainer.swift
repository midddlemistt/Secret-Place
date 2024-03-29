//
//  MapViewContainer.swift
//  Secret Place
//
//  Created by 123 on 16.03.24.
//

import SwiftUI

struct MapViewContainer: View {
    @StateObject var routeViewModel = RouteViewModel()
    

    var body: some View {
        ZStack {
            MainMapView(viewModel: routeViewModel)
                .edgesIgnoringSafeArea(.all)
            
            if let currentQuest = routeViewModel.currentQuest {
                questView(for: currentQuest)
            }

            if routeViewModel.showRouteDetails, let selectedRoute = routeViewModel.selectedRoute {
                RouteDetailView(viewModel: routeViewModel, route: .constant(selectedRoute), onClose: {
                    routeViewModel.showRouteDetails = false
                }, onStartRoute: {
                    routeViewModel.startRoute()
                    routeViewModel.currentPointIndex = 0 // Начинаем с первой точки маршрута
                })
                .transition(.slide)
                .animation(.default)
            }
            
            if routeViewModel.routeStarted, let currentIndex = routeViewModel.currentPointIndex,
               let route = routeViewModel.selectedRoute, !route.points.isEmpty {
                VStack {
                    Spacer()
                    nextPointView(point: route.points[currentIndex])
                }
                .transition(.move(edge: .bottom))
                .animation(.default)
            }
            
            if routeViewModel.routeCompleted {
                completionMessage()
            }
        }
    }
    
    @ViewBuilder
    private func nextPointView(point: Route.RoutePoint) -> some View {
        HStack {
            Text("Ваша следующая точка: \(point.title)")
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
            
            Spacer()
            
            Button(action: {
                routeViewModel.reachNextPoint()
            }) {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .frame(width: 44, height: 44)
                    .background(Color.green)
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
        }
        .padding(.horizontal)
        .padding(.bottom, 20) // Добавляем дополнительный отступ снизу для разделения от других элементов интерфейса, если они есть
    }

    
    @ViewBuilder
    private func completionMessage() -> some View {
        Text("Маршрут завершен")
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
            .transition(.opacity)
            .animation(.easeIn)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    routeViewModel.routeCompleted = false
                }
            }
    }
    
    @ViewBuilder
    private func questView(for quest: Quest) -> some View {
        // Проверка типа квеста и создание соответствующей ViewModel
        if let questionQuest = quest as? QuestionQuest {
            // Создаем ViewModel для квеста
            let viewModel = QuestionQuestViewModel(quest: questionQuest)
            // Передаем ViewModel во вью
            QuestionQuestView(viewModel: viewModel)
        }
        // Добавьте здесь другие условия для разных типов квестов с их ViewModel
        else {
            Text("Неподдерживаемый тип квеста")
        }
    }

    
}



//#Preview {
//    MapViewContainer()
//}
