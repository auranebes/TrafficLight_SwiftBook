//
//  TrafficLights.swift
//  ColorizedApp_SwiftBook
//
//  Created by Arslan Abdullaev on 16.02.2022.
//

import SwiftUI

struct TrafficLight {
    var redLightOpacity = 0.3
    var yellowLightOpacity = 0.3
    var greenLightOpacity = 0.3
    
    var buttonTitle = "START"
    
    enum Lights {
        case redLight
        case yellowLight
        case greenLight
    }
}
