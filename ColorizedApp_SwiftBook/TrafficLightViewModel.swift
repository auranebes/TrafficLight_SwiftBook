//
//  TrafficLightViewModel.swift
//  ColorizedApp_SwiftBook
//
//  Created by Arslan Abdullaev on 16.02.2022.
//

import SwiftUI

class TrafficLightViewModel: ObservableObject {
    @Published var trafficLightViewModel = TrafficLight()
    private var lights = TrafficLight.Lights.redLight

    
    func changeLight() {
        switch lights {
        case .redLight:
            trafficLightViewModel.redLightOpacity = 1
            trafficLightViewModel.greenLightOpacity = 0.3
            lights = .yellowLight
        case .yellowLight:
            trafficLightViewModel.yellowLightOpacity = 1
            trafficLightViewModel.redLightOpacity = 0.3
            lights = .greenLight
        case .greenLight:
            trafficLightViewModel.greenLightOpacity = 1
            trafficLightViewModel.yellowLightOpacity = 0.3
            lights = .redLight
        }
    }
 
    
}

