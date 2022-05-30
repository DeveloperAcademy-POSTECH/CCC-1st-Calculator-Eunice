//
//  Extensions.swift
//  Clone-Calculator
//
//  Created by Hyorim Nam on 2022/05/29.
//

import SwiftUI

//ref: https://stackoverflow.com/questions/56906408/swiftui-how-to-add-custom-modifier-for-text

extension Text{
    //operands
    //if clicked -> color toggle
    func customTextOrange(_ buttonSize: CGFloat) -> some View {
//    func customTextOrange(_ buttonSize: CGFloat, _ invert: Bool) -> some View {
        self.font(.system(size: buttonSize*0.4, design: .monospaced)).fontWeight(.bold)
            .foregroundColor(.white)
//            .foregroundColor(invert ? .orange : .white)
            .background(Circle()
                .fill(.orange)
//                .fill(invert ? .white : .orange)
                .frame(width: buttonSize, height: buttonSize)
            )
            .frame(width: buttonSize, height: buttonSize)
    }
    //AC-C, etc
    func customTextLightGray(_ buttonSize: CGFloat) -> some View {
        self.font(.system(size: buttonSize*0.4))
            .foregroundColor(.black)
            .background(Circle()
                .fill(Color(UIColor.lightGray))
                .frame(width: buttonSize, height: buttonSize)
            )
            .frame(width: buttonSize, height: buttonSize)
    }
    //0-9, '.'
    func customTextDarkGray(_ buttonSize: CGFloat) -> some View {
        self.font(.system(size: buttonSize*0.5))
            .foregroundColor(.white)
            .background(Circle()
                .fill(Color(UIColor.systemGray4))
                .frame(width: buttonSize, height: buttonSize)
            )
            .frame(width: buttonSize, height: buttonSize)
    }
}
