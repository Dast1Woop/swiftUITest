//
//  ContentView.swift
//  ColorTest
//
//  Created by LongMa on 2022/9/27.
//

import SwiftUI

struct ContentView: View {
    @State var redValue:Double = 0.2
    @State var greenValue:Double = 0.3
    @State var blueValue:Double = 0.4
    @State var alphaValue:Double = 0.5
    
    var body: some View {
        VStack {
            Color("customColor1")
                .ignoresSafeArea()
                .frame(width: 200, height: 200, alignment: .leading)
                .cornerRadius(40)
                .overlay(Text.init("Hi").font(Font.system(size: 40)))
            RoundedRectangle(cornerRadius: 60)
                .fill(.red)
                .overlay(Text.init("hello world").font(Font.system(size: 50)).foregroundColor(.white)).colorInvert()
            
            Circle()
                .fill(Color(red: redValue, green: greenValue, blue: blueValue, opacity:alphaValue))
                .frame(width: 150, height: 150, alignment: .trailing)
            
            VStack {
                Slider(value: $redValue).tint(.red)
                Slider(value: $greenValue).tint(.green)
                Slider(value: $blueValue).tint(.blue)
                Slider(value: $alphaValue).tint(.gray)
            }.padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone SE (2nd generation)")
            ContentView()
                .previewDevice("iPhone 13 mini")
        }
    }
}
