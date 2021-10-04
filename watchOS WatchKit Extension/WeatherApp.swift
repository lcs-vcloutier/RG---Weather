//
//  WeatherApp.swift
//  watchOS WatchKit Extension
//
//  Created by Vincent Cloutier on 2021-10-04.
//

import SwiftUI

@main
struct WeatherApp: App {
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some Scene {
        WindowGroup {
            
            TabView {
                
                NavigationView {
                    // Call site for ContentView (where you create an instance of something)
                    ContentView(viewModel: viewModel,
                                temperature: viewModel.history.last!.temperature,
                                feel: viewModel.history.last!.feel,
                                conditions: viewModel.history.last!.condition.description)
                }
                .tabItem {
                    Image(systemName: "sun.haze.fill")
                    Text("Current")
                }
                
                NavigationView {
                    HistoryView(viewModel: viewModel)
                }
                .tabItem {
                    Image(systemName: "clock.fill")
                    Text("History")
                }
            }
        }
    }
}
