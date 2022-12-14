//
//  ContentView.swift
//  SoundGrade
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
                    Text("Sound Grade")
                }
                .tag(1)
            AboutView()
                .tabItem {
                    Image(systemName: "music.note.tv.fill")
                    Text("About App")
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
