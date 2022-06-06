//
//  OnBoardingView.swift
//  RiveAnimation
//
//  Created by ENFINY INNOVATIONS on 6/6/22.
//

import SwiftUI
import RiveRuntime

struct OnBoardingView: View {
    
    let button = RiveViewModel(fileName: "button")
    
    var body: some View {
        ZStack {
      
            backgroundView
            
            button.view()
                .frame(width: 236, height: 64)
                .overlay(
                    Label("Start the Course", systemImage: "arrow.forward")
                        .offset(x: 4, y: 4)
                        .font(.headline)
                    
                )
                .background(
                    Color.black.cornerRadius(30)
                        .blur(radius: 10)
                        .opacity(0.3)
                        .offset(y: 10)
                    
                )
                .onTapGesture {
                    button.play(animationName: "active")
                }
        }
    }
    
    var backgroundView: some View {
        RiveViewModel(fileName: "shapes").view()
            .ignoresSafeArea()
            .blur(radius: 30)
            .background(
                Image("Spline")
                    .blur(radius: 50)
                    .offset(x: 200, y: 100)
        )
    }
    
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
