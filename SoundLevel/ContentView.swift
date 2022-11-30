//
//  ContentView.swift
//  SoundLevel
//
//  Created by 常志平 on 29/11/22.
//

import SwiftUI

struct ContentView: View {
    let columnLayout = Array(repeating: GridItem(), count: 4)
    
    let allColors: [Color] = [
        .pink,
        .red,
        .orange,
        .yellow,
        .mint,
        .teal,
        .cyan,
        .blue,
        .indigo,
        .purple,
        .brown,
        .gray
    ]
    
    
    var body: some View {
        VStack {
            LazyVGrid(columns: columnLayout) {
                ForEach(allColors, id: \.self) { color in
                    Button {
                        print("do something")
                    } label: {
                        ZStack {
                            Text("Test of \(color.description)")
                            RoundedRectangle(cornerRadius: 30.0)
                                .aspectRatio(1.0, contentMode: ContentMode.fit)
                                .foregroundColor(color)
                            .opacity(0.5)
                        }
                    }
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
