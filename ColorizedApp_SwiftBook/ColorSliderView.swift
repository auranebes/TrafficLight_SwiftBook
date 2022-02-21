//
//  ColorSliderView.swift
//  ColorizedApp_SwiftBook
//
//  Created by Arslan Abdullaev on 21.02.2022.
//

import SwiftUI

struct ColorView: View {
    @State var value = Double.random(in: 0...255)
    @State var label = ""
    
    var body: some View{
        ColorSliderView(value: $value, label: $label, color: .red)
    }
}

struct colorTF: View {
    
    @Binding var value: Double
    @Binding var labelTF: String
    
    var body: some View {
        TextField("\(lround(value))", text: $labelTF)
            .keyboardType(.decimalPad)
            .textFieldStyle(.roundedBorder)
            .frame(width: 60, height: 40)
    }
}

struct ColorSliderView: View {
    
    @Binding var value: Double
    @Binding var label: String
    let color: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))")
                .foregroundColor(color)
                .fontWeight(.bold)
                .frame(width: 60, height: 40)
            Slider(value: $value, in: 0...255, step: 1)
                .tint(color)
            colorTF(value: $value, labelTF: $label)
        }
        .padding(.horizontal)
    }
}


struct ColorSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSliderView(value: .constant(12), label: .constant("12"), color: .red)
    }
}
