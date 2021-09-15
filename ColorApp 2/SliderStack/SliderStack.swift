//
//  SliderStack.swift
//  ColorApp 2
//
//  Created by Robert Miller on 15.09.2021.
//

import SwiftUI

struct SliderStack: View {
    @Binding var dValue: Double
    @State var sValue = ""
    
    var color: Color

    var body: some View {
        HStack {
            SliderLabel(dValue: dValue)
            
            Slider(value: $dValue, in: 0...255, step: 1)
                .onChange(of: dValue) { value in
                    sValue = "\(lround(dValue))"
                }
                .onAppear {
                sValue = "\(lround(dValue))"
                }
                .shadow(color: color, radius: 5)
                .accentColor(color)
            
            SliderTextField(sValue: $sValue, dValue: $dValue, color: color)
        }
    }
}
struct SilderStack_Previews: PreviewProvider {
    static var previews: some View {
        SliderStack(dValue: .constant(255), color: .red)
    }
}

