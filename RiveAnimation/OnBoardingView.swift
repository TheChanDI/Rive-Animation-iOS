//
//  OnBoardingView.swift
//  RiveAnimation
//
//  Created by ENFINY INNOVATIONS on 6/6/22.
//

import SwiftUI
//import RiveRun
import RiveRuntime

struct OnBoardingView: View {
    
    let button = RiveViewModel(fileName: "button")
    @State var showModal = false
    
    var body: some View {
        ZStack {
            
            backgroundView
            
            content
                .offset(y: showModal ? -50 : 0)
            
            Color("Shadow")
                .opacity(showModal ? 0.4 : 0)
                .ignoresSafeArea()
            
            if showModal {
                SignInView(showModal: $showModal)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .overlay(
                        Button {
                            withAnimation(.spring()) {
                                showModal = false
                            }
                            
                        } label: {
                            Image(systemName: "xmark")
                                .frame(width: 36, height: 36)
                                .foregroundColor(.black)
                                .background(.white)
                                .mask(Circle())
                                .shadow(color: Color("Shadow").opacity(0.3), radius: 5, x: 0, y: 3)
                        }
                            .frame(maxHeight: .infinity, alignment: .bottom)
                        
                    )
                    .zIndex(1)
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
    
    var content: some View {
        VStack (alignment: .leading, spacing: 16) {
            
            Text("Learn Design & Code")
                .font(.custom("Poppins Bold", size: 60, relativeTo: .largeTitle))
                .frame(width: 260, alignment: .leading)
            
            Text("Don't skip design. Learn Design and code, by building real apps with RiveAnimation and Swift. Complete courses about the best tools.")
                .customFont(.body)
            
            Spacer()
            
            HStack {
                Spacer()
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
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                            withAnimation(.spring()) {
                                showModal = true
                            }
                        }
                    }
                Spacer()
            }
            
            
            
            Text("Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates.")
                .multilineTextAlignment(.center)
                .customFont(.footnote)
            
        }
        .padding(40)
    }
    
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
            .previewDevice("iPhone 11 Pro")
    }
}
