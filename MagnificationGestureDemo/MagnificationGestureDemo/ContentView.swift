//
//  ContentView.swift
//  MagnificationGestureDemo
//
//  Created by LongMa on 2022/11/16.
//

import SwiftUI

struct ContentView: View {
    @GestureState var magBy = 1.0
    
    var magGes: some Gesture {
        return MagnificationGesture(
            //minimumScaleDelta: 1.5//要配合gesState = crtState使用
        )
            .updating($magBy) { crtState, gesState, transaction in
                gesState = crtState.magnitude
            }
    }
    
    var body: some View {
        Rectangle().frame(width: 200, height: 200, alignment: .center)
            .foregroundColor(.orange)
            .scaleEffect(magBy)
            .gesture(magGes)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
