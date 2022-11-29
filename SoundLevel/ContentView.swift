//
//  ContentView.swift
//  SoundLevel
//
//  Created by 常志平 on 29/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Button(action: {
                print("did tap...")
            }, label: {Text("1")})
            
            Button(action: {
                print("did tap...")
            }, label: {Text("2")})
            
            Button(action: {
                print("did tap...")
            }, label: {Text("3")})
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
