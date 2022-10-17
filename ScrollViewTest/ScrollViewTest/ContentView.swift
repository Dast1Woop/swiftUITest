//
//  ContentView.swift
//  ScrollViewTest
//
//  Created by LongMa on 2022/10/17.
//

import SwiftUI

struct Test1View: View {
    var body: some View {
        ScrollView([.horizontal, .vertical]) {//默认只能竖向滚动
            
            //case 1
            LazyVStack {
                ForEach(0..<51){ idx in
                    Image(systemName: "\(idx).circle.fill")
                }
            }
        }
    }
    
}

struct Test2View: View {
    var body: some View {
        ScrollView([.horizontal, .vertical], showsIndicators: false) {//默认只能竖向滚动
            
            ScrollView([.horizontal, .vertical], showsIndicators: false) {//默认只能竖向滚动
                
                //case 2
                LazyVStack {
                    LazyHStack {
                        ForEach(0..<51){ idx in
                            Image(systemName: "\(idx).circle.fill")
                        }
                    }
                    Image("mm", bundle: nil)
                        .frame(width: 1000, height: 1000, alignment: .center)
                        .background(.orange)
                }
            }
        }
    }
    
}


struct Test3View: View {
    var body: some View {
        ScrollView([.horizontal, .vertical], showsIndicators: true) {
            VStack {
                ForEach(0..<60) {i in
                    HStack {
                        ForEach(0..<60) {j in
                            ZStack{
                                Circle() .frame(width: 40, height: 40, alignment: .center)
                                let str = NSString.init(format: "%02d-%02d", i, j)
                                let s = String.init(str)
                                Text(s).foregroundColor(.white).font(.system(size: 12))
                            }
                        }
                    }
                }
            }
        }
    }
}


struct ContentView: View {
    var body: some View {
        Test1View()
        Test2View()
        Test3View()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
