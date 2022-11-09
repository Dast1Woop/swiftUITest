//
//  ContentView.swift
//  AVPlayerDemo
//
//  Created by LongMa on 2022/11/9.
//

import SwiftUI
import AVKit

struct ContentView: View {
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
            
//            let url = Bundle.main.url(forResource: "flower", withExtension: ".mp4")
//            if let url = url {
//                let player = AVPlayer(url: url)
//                VideoPlayer(player: player)
//            }
            
            MyPlayerAutoPlay()
            
//            let url2 = URL(string: "https://www.pexels.com/video/10167684/download/")
//            if let url2 = url2 {
//                let player = AVPlayer(url: url2)
//                VideoPlayer(player: player)
//            }
            
        }
    }
}

struct MyPlayerAutoPlay:View {

    let player = AVPlayer(url: Bundle.main.url(forResource: "flower", withExtension: ".mp4")!)
    let playEndPub = NotificationCenter.default.publisher(for: Notification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
    var body: some View {
      return
        VStack{
            Text("hi")
            
            VideoPlayer(player: player)
        }.onAppear {
            player.play()
        }.onReceive(playEndPub) { output in
            player.seek(to: CMTime.zero )
            player.play()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
