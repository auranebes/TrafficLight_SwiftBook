//
//  Home.swift
//  ColorizedApp_SwiftBook
//
//  Created by Arslan Abdullaev on 16.02.2022.
//

import SwiftUI

struct TrafficLightView: View {
    
    @ObservedObject var viewModel = TrafficLightViewModel()
    
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
        VStack{
            VStack(spacing: 30){
            CircleView(color: Color.red.opacity(viewModel.trafficLightViewModel.redLightOpacity))
            CircleView(color: Color.yellow.opacity(viewModel.trafficLightViewModel.yellowLightOpacity))
            CircleView(color: Color.green.opacity(viewModel.trafficLightViewModel.greenLightOpacity))
            }
            Spacer()
            Button {
                viewModel.changeLight()
                if viewModel.trafficLightViewModel.buttonTitle == "START" {
                    viewModel.trafficLightViewModel.buttonTitle = "NEXT"
                }
            } label: {
                RoundedRectangle(cornerSize: CGSize(width: WIDTH, height: HEIGHT * 0.4))
                    .foregroundColor(.purple)
                    .overlay {
                        Text(viewModel.trafficLightViewModel.buttonTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .font(.title)
                    }
                    .frame(width: WIDTH * 0.45, height: HEIGHT * 0.1)
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        TrafficLightView()
    }
}
