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
    
   
    @State private var redValueTF = "0"
    @State private var greenValueTF = "0"
    @State private var blueValueTF = "0"
    
    var body: some View {
        ZStack{
            Rectangle().ignoresSafeArea()
            VStack {
                ColorView(red: redValue, green: greenValue, blue: blueValue)
                VStack {
                SliderStack(dValue: $redValue, sValue: $redValueTF, color: .red)
                SliderStack(dValue: $greenValue, sValue: $greenValueTF, color: .green)
                SliderStack(dValue: $blueValue, sValue: $blueValueTF, color: .blue)
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
    @State private var showAlert = false
    
    @Binding  var dValue: Double
    @Binding  var sValue: String
    
    var color: Color

    var body: some View {
        HStack {
            Text("\(lround(dValue))")
                .foregroundColor(.white)
                .frame(width: 40)

            Slider(value: $dValue, in: 0...255, step: 1)
                { _ in sValue = "\(lround(dValue))" }
                .shadow(color: color, radius: 5)
                .accentColor(color)
            
            TextField("", text: $sValue, onCommit: checkValue)
                .alert(isPresented: $showAlert) {
                Alert(title: Text("Wrong Format!"),
                      message: Text("Enter correct value from 0 to 255"))
                }
                .multilineTextAlignment(.center)
                .frame(width: 45)
                .foregroundColor(.white)
                .overlay(RoundedRectangle(cornerRadius: 4)
                           .stroke(lineWidth: 2)
                           .foregroundColor(color))
        }
    }
    
    func checkValue(){
        if let value = Double(sValue) {
            if value <= 255 && value >= 0 {
                dValue = value
            }
            else {
                sValue = "\(lround(dValue))"
                showAlert.toggle()
            }
        } else {
            sValue = "\(lround(dValue))"
            showAlert.toggle()
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
            .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.white))

            .padding()
    }
    var color = Color(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
}
