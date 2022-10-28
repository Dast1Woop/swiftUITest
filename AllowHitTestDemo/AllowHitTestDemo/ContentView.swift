//
//  ContentView.swift
//  AllowHitTestDemo
//
//  Created by LongMa on 2022/10/28.
//

import SwiftUI

struct ContentView: View {
    @State var text = "hello"
    @State var text4UpperBtn = "upper btn"
    
    @State var isBtmBtnUserInteractive = true
    @State var isUpperBtnUserInteractive = true
    var body: some View {
        VStack {
            Text(text)
                .padding()
            
            VStack {
                
                //这种创建方式，按钮响应区域仅仅是点击文本区域！！！
                Button("btm btn") {
                    text = "\(arc4random_uniform(100))"
                }.frame(width: 200, height: 200, alignment: .center)
                .background(.orange)

                ZStack {
                    //推荐这种带 label 参数的，这种响应区域才是 frame 区域。
                    Button {
                        text = "\(arc4random_uniform(100))"
                    } label: {
                        Text("___").frame(width: 200, height: 200, alignment: .center)
                            .background(.orange)
                    }.buttonStyle(.bordered) .allowsHitTesting(isBtmBtnUserInteractive)
                    
                    Button {
                        text4UpperBtn = "\(arc4random_uniform(5))"
                    } label: {
                        Text(text4UpperBtn).frame(width: 200, height: 100, alignment: .center)
                            .background(.gray)
                    }.buttonStyle(.borderless) .allowsHitTesting(isUpperBtnUserInteractive)
                }
                
                Toggle("btm btn", isOn: $isBtmBtnUserInteractive)
                Toggle("upper btn", isOn: $isUpperBtnUserInteractive)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
