//
//  ContentView.swift
//  FullScreenCoverDemo
//
//  Created by LongMa on 2022/11/2.
//

import SwiftUI

struct ContentView: View {
    @State private var showCoverView:Bool = false
    
    ///Cannot assign to property: 'self' is immutable:必须加 @State
    @State private var backColor = Color.green
    
    @State private var item:MessageItem?
    
    var body: some View {
        ZStack {
            backColor.ignoresSafeArea()
            
            VStack {
                Text("Hello, world!")
                    .padding()
                Button("popCover") {
                    
                    //Use this method to toggle a Boolean value from true to false or from false to true
                    showCoverView.toggle()
                }
                .fullScreenCover(isPresented: $showCoverView) {
                    backColor = Color.gray
                } content: {
                    MyPopOverView()
                }
                
                
                Button("popCoverWithItem") {
                    item = MessageItem(msg: "This is item inputing")
                }
                //A binding to an optional source of truth for the sheet. When item is non-nil, the system passes the contents to the modifier’s closure. You display this content in a sheet that you create that the system displays to the user. If item changes, the system dismisses the currently displayed sheet and replaces it with a new one using the same process.
                .fullScreenCover(item: $item) {
                    backColor = Color.yellow
                } content: { item in
                    MyItemCoverView(item: item)
                }
            }
        }
        //        .popover(isPresented: $showCoverView) {
        //            MyPopOverView()
        //        }
        
    }
}

struct MyPopOverView:View {
    
    ///声明变量，关联系统环境变量，奇怪的语法！！！
    @Environment(\.dismiss) var dismissPopOverV;
    var body: some View {
        Color.red
            .ignoresSafeArea()
            .onTapGesture {
                dismissPopOverV()
            }
    }
}

struct MessageItem:Identifiable {
    let id = UUID()
    let msg:String?
}

/**Another overload of fullScreenCover modifier takes item as a parameter instead of isPresented parameter. Item is a value provided to build the modal, which will be presented, when value goes from nil to a value. Item needs to conform to the identifiable protocol and upon dismissal of modal, item automatically becomes nil.
 */
struct MyItemCoverView:View {
    
    ///声明变量，关联系统环境变量，奇怪的语法！！！
    @Environment(\.dismiss) var dismissPopOverV;
    
    let item:MessageItem?
    
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
                .onTapGesture {
                    dismissPopOverV()
                }
            if let item = item, let msg = item.msg {
                Text(msg)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
