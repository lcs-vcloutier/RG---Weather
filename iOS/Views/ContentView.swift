//
//  ContentView.swift
//  iOS
//
//  Created by Russell Gordon on 2021-10-02.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: WeatherViewModel
    
    @State private var temperature: Double = 0.0
    
    @State private var feel: String = ""

    @State private var conditions: String = ""

    var body: some View {

        VStack {
            
            Spacer()
            
            Text("\(conditions)")
                .font(.title)

            Text("\(String(format: "%.1f", arguments: [temperature])) °C")
                .font(.largeTitle)
                .bold()
            
            Text("\(feel)")
                .font(.title3)
            
            Spacer()
            
            Button {
                
                // Get a new prediction from the view model
                let prediction = viewModel.providePrediction()
                
                // Populate state variables so the user interface updates
                temperature = prediction.temperature
                feel = "That's \(prediction.feel.lowercased())."
                conditions = prediction.condition.description
                
            } label: {
                Text("Get New Prediction")
            }
            
            Spacer()

            
        }
        .navigationTitle("Current")
        
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
