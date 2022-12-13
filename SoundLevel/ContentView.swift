//
//  ContentView.swift
//  SoundLevel
//
//  Created by 常志平 on 29/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ColorArrayView()
                .tabItem {
                    Image(systemName: "music.quarternote.3")
                    Text("音级计算")
                }
                .tag(1)
            AboutView()
                .tabItem {
                    Image(systemName: "music.note.tv.fill")
                    Text("关于程序")
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
