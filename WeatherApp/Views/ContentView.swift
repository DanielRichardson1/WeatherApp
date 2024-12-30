//
//  ContentView.swift
//  WeatherApp
//
//  Created by Daniel Richardson on 12/26/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                                try await
                                weather = weatherManager.getCurrentWeather(
                                    latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error fetching weather: \(error)")
                            }
                        }
                }
            } else {
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
