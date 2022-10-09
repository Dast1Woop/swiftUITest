//
//  ContentView.swift
//  NavigationViewTest
//
//  Created by LongMa on 2022/10/9.
//

import SwiftUI

struct ContentView: View {
    @State var hasLogin = true
    var body: some View {
        NavigationView {
            Group {
                if hasLogin {
                    Text("welcome")
                }else {
                    Text("login pls")
                }
              
            }
            .navigationTitle(LocalizedStringKey.init("title"))
            .font(.largeTitle)
            .foregroundColor(.red)
          
        }.onTapGesture {
            hasLogin = !hasLogin
        }
        
        Label("lbl", systemImage: "heart")
        
        Label("lbl", systemImage: "star")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

    }
}
