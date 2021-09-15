//
//  SliderTextField.swift
//  ColorApp 2
//
//  Created by Robert Miller on 15.09.2021.
//

import SwiftUI

struct SliderTextField: View {
    @Binding  var sValue: String
    @Binding  var dValue: Double
    let color: Color
    
    @State private var showAlert: Bool = false
    
    var body: some View {
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
    
    func checkValue(){
        if let value = Double(sValue), (0...255).contains(value) {
                dValue = value
        } else {
            sValue = "\(lround(dValue))"
            showAlert.toggle()
        }
    }
}

struct SliderTextField_Previews: PreviewProvider {
    static var previews: some View {
        SliderTextField(sValue: .constant("255"), dValue: .constant(255.0), color: .red)
    }
}
