//
//  ContentView.swift
//  ColorApp 2
//
//  Created by Robert Miller on 11.09.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redValue: Double = 0
    @State private var greenValue: Double = 0
    @State private var blueValue: Double = 0
    
    @State private var viewColor = Color(.white)
    @State private var value = ""
    var body: some View {
        ZStack{
            Rectangle().ignoresSafeArea()
            VStack {
                
                ColorView(red: redValue, green: greenValue, blue: blueValue)
                VStack {
                SliderStack(dValue: $redValue, sValue: $value, color: .red)
                SliderStack(dValue: $greenValue, sValue: $value, color: .green)
                SliderStack(dValue: $blueValue, sValue: $value, color: .blue)
                }.padding()
                Spacer()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SliderStack: View {
    @Binding  var dValue: Double
    @Binding  var sValue: String
    var color: Color
    var body: some View {
        HStack {
            Text("\(lround(dValue))").foregroundColor(.white)
                .frame(width: 40)
            Slider(value: $dValue, in: 0...255, step: 1).shadow(color: color, radius: 5)
                .accentColor(color)
            TextField("", text: $sValue)
                .multilineTextAlignment(.center)
                .frame(width: 45)
                .foregroundColor(.white)
                .overlay(RoundedRectangle(cornerRadius: 4)
                            .stroke(lineWidth: 2)
                            .foregroundColor(color))
        }
      
    }
}

struct ColorView: View {
    var red: Double
    var green: Double
    var blue: Double
    
    var body: some View {
        RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
            .frame(width: 340, height: 160)
            .foregroundColor(Color(red: red/255,
                                  green: green/255,
                                  blue: blue/255))

            .padding()
    }
    var color = Color(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
}
