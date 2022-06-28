//
//  View+Extension.swift
//  RiveAnimation
//
//  Created by ENFINY INNOVATIONS on 6/28/22.
//

import SwiftUI

struct RounderCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
    
    
}


extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RounderCorner(radius: radius, corners: corners))
    }
}
