//
//  ContentView.swift
//  RiveAnimation
//
//  Created by ENFINY INNOVATIONS on 6/6/22.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("selectedTab") var selectedTab: Tab = .chat
    
    var body: some View {
        ZStack {
            
            switch selectedTab {
            case .chat:
                Text("Chat")
            case .search:
                Text("search")
            case .timer:
                Text("timer")
            case .bell:
//                Text("bell")
                OnBoardingView()
            case .user:
//                Text("user")
                SignInView(showModal: .constant(true))
            }
            
            TabBar()
           
        }
     
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11 Pro")
    }
}
