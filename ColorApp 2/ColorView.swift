//
//  ColorView.swift
//  ColorApp 2
//
//  Created by Robert Miller on 15.09.2021.
//

import SwiftUI

struct ColorView: View {
    
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
        RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
            .frame(width: 340, height: 160)
            .foregroundColor(Color(red: red/255,
                                  green: green/255,
                                  blue: blue/255))
            .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.white))

            .padding()
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(red: 255, green: 255, blue: 255)
    }
}
