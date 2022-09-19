//
//  ContentView.swift
//  DividerTest
//
//  Created by LongMa on 2022/9/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
        
        HStack {
            Image.init(systemName: "car")
            
            Divider()
                .overlay(Color.green)
                .frame(width: 10, height: 20, alignment: .center)
                .background(Color.red)
                .overlay(Color.blue)
//                .overlay(Color.green)
            
            Image.init(systemName: "bus")
            
            VStack {
                Image.init(systemName: "square.and.arrow.up")
                Divider()
                    .overlay(Color.yellow)
                    .frame(width: 100, height: 40, alignment: .center)
                    .overlay(Color.cyan)
                Image.init(systemName: "pencil")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .padding(.vertical)
            ContentView()
                .padding(.vertical)
        }
    }
}
