//
//  ContentView.swift
//  TextStyleTest
//
//  Created by LongMa on 2022/10/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            //运行后才能看到时间在动，canvas看不到时间在动
            Text(Date(), style: .date)
            Text(Date(), style: .time)
            Text(Date(), style: .offset)
            Text(Date(), style: .relative)
            Text(Date(), style: .timer)
            Divider()
                .background(.orange)
                .frame(width: 300,height: 14)
//                .foregroundColor(.blue)
                .overlay(.cyan)//覆盖色才有用，foregroundColor看不出颜色效果
            Text(Date().formatted(date:.complete, time:.complete))
            Text(Date().formatted(date:.numeric, time:.standard))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
