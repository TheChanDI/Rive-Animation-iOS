//
//  TabBar.swift
//  RiveAnimation
//
//  Created by ENFINY INNOVATIONS on 6/29/22.
//

import SwiftUI
import RiveRuntime

struct TabBar: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .chat
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                content
            }
            .padding(12)
            .background(Color("Background 2").opacity(0.8))
            .background(.ultraThinMaterial)
            .mask(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .shadow(color: Color("Background 2").opacity(0.3), radius: 20, x: 0, y: 20)
            .overlay(
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .stroke(.linearGradient(colors: [.white.opacity(0.5), .white.opacity(0)], startPoint: .topLeading, endPoint: .bottomTrailing))
            )
            .padding([.horizontal, .vertical], 24)
        }
        
    }
    
    var content: some View {
        ForEach(tabItems) { item in
            Button {
                item.icon.setInput("active", value: true)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    item.icon.setInput("active", value: false)
                }
                withAnimation {
                    selectedTab = item.tab
                }
            } label: {
                item.icon.view()
                    .frame(height: 36)
                    .opacity(selectedTab == item.tab ? 1 : 0.5)
                    .background(
                        VStack {
                            RoundedRectangle(cornerRadius: 2)
                                .frame(width: 20, height: 4)
                                .offset(y: -4)
                                .opacity(selectedTab == item.tab ? 1 : 0)
                            Spacer()
                        }
                    )
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .previewDevice("iPhone 11 Pro")
    }
}


struct TabItem: Identifiable {
    var id = UUID().uuidString
    var icon: RiveViewModel
    var tab: Tab
}


var tabItems = [
    TabItem(icon: .init(fileName: "icons", stateMachineName: "CHAT_Interactivity", artboardName: "CHAT"), tab: .chat),
    TabItem(icon: .init(fileName: "icons", stateMachineName: "SEARCH_Interactivity", artboardName: "SEARCH"), tab: .search),
    TabItem(icon: .init(fileName: "icons", stateMachineName: "TIMER_Interactivity", artboardName: "TIMER"), tab: .timer),
    TabItem(icon: .init(fileName: "icons", stateMachineName: "BELL_Interactivity", artboardName: "BELL"), tab: .bell),
    TabItem(icon: .init(fileName: "icons", stateMachineName: "USER_Interactivity", artboardName: "USER"), tab: .user),
]


enum Tab: String {
    case chat
    case search
    case timer
    case bell
    case user
}
