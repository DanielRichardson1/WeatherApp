//
//  ContentView.swift
//  WeatherApp
//
//  Created by Daniel Richardson on 12/26/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                Text("Your coordinates are \(location.latitude), \(location.longitude)")
            } else{
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
         }
        .background(Color(hue: 0.66, saturation: 0.829, brightness: 0.338))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
