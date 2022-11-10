//
//  ContentView.swift
//  ShadowDemo
//
//  Created by LongMa on 2022/11/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
            Rectangle().foregroundColor(Color.orange)
                .frame(width: 200, height: 200, alignment: .center)
                .shadow(color: Color.green, radius: 2, x: 20, y: -20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
