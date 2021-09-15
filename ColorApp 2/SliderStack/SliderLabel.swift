//
//  SliderLabel.swift
//  ColorApp 2
//
//  Created by Robert Miller on 15.09.2021.
//

import SwiftUI

struct SliderLabel: View {
    let dValue: Double
    
    var body: some View {
        Text("\(lround(dValue))")
            .foregroundColor(.white)
            .frame(width: 40)
    }
}

struct SliderLabel_Previews: PreviewProvider {
    static var previews: some View {
        SliderLabel(dValue: 255)
    }
}
