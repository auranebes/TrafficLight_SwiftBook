//
//  HomeView.swift
//  ColorizedApp_SwiftBook
//
//  Created by Arslan Abdullaev on 21.02.2022.
//

// TextFiled недоработан, проверку проходит только когда полностью заполняются все 3 TF

import SwiftUI

struct HomeView: View {
    
    @State var redColor = 12.0
    @State var greenColor = 12.0
    @State var blueColor = 12.0
    
    @State var redLabel: String = ""
    @State var greenLabel: String = ""
    @State var blueLabel: String = ""
    
    @FocusState private var focusInput: Bool
    @State var alertPresent = false
    
    
    
    
    var body: some View {
        ZStack{
            Color.purple
                .ignoresSafeArea()
            VStack{
            RoundedRectangle(cornerRadius: 40)
                    .foregroundColor(Color(uiColor: UIColor(red: CGFloat(redColor/255),
                                                            green: CGFloat(greenColor/255),
                                                            blue: CGFloat(blueColor/255),
                                                            alpha: 1)))
                    .frame(width: WIDTH * 0.9, height: HEIGHT * 0.3)
                Spacer()
                VStack(spacing: 30){
                ColorSliderView(value: $redColor, label: $redLabel, color: .red)
                ColorSliderView(value: $greenColor, label: $greenLabel, color: .green)
                ColorSliderView(value: $blueColor, label: $blueLabel, color: .blue)
                }
                Spacer()
            }
            .focused($focusInput)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button(action: { doneButtonPressed()}) {
                        Text("Done")
                    }
                    .alert("Неправильное значение",
                           isPresented: $alertPresent,
                           actions: {}) {
                        Text("Значение должно быть от 0 до 255")
                    }
                }
            }
            .padding()
            Spacer()
        }
    }
    private func doneButtonPressed() {
        guard let rLabel = Double(redLabel) else {
            alertPresent = true
            return
        }
        if rLabel <= 255 {
            redColor = rLabel
        } else {
            alertPresent = true
            redLabel = String(redColor)
            return
        }
        
        guard let gLabel = Double(greenLabel) else {
            alertPresent = true
            return
        }
        if gLabel <= 255 {
            greenColor = gLabel
        } else {
            alertPresent = true
            greenLabel = String(greenColor)
            return
        }
        
        guard let bLabel = Double(blueLabel) else {
            alertPresent = true
            return
        }
        if bLabel <= 255 {
            blueColor = bLabel
        } else {
            alertPresent = true
            blueLabel = String(blueColor)
            return
        }
       
        focusInput = false
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


