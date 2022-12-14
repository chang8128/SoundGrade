//
//  PreLaunch.swift
//  SoundGrade
//
//  Created by 常志平 on 13/12/22.
//

import SwiftUI

struct PreLaunch: View {
    @State private var showMainView = false
    @State private var angle: Double = 360
    @State private var opacity: Double = 1
    @State private var scale: CGFloat = 1
    
    var body: some View {
        Group {
            if showMainView {
                ContentView()
            } else {
                ZStack {
                    Image("SGLogo")
                        .frame(width: 200, height: 200)
                        .rotation3DEffect(.degrees(angle), axis: (x: 0.0, y: 1.0, z: 0.0))
                        .opacity(opacity)
                        .scaleEffect(scale)
                }
            }
        }
        .onAppear {
            withAnimation(.linear(duration: 1.76)) {
                angle = 0
                scale = 3
                opacity = 0
            }
            withAnimation(.linear.delay(1.76)) {
                showMainView = true
            }
        }
    }
}

struct PreLaunch_Previews: PreviewProvider {
    static var previews: some View {
        PreLaunch()
    }
}
