//
//  TestNumbersView.swift
//  SoundLevel
//
//  Created by 常志平 on 30/11/22.
//

import SwiftUI

struct TestNumbersView: View {
    let columnLayoutA = Array(repeating: GridItem(), count: 4)
    
    let allNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    
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
        
        ScrollView {
            LazyVGrid(columns: columnLayoutA) {
                ForEach(allNumbers, id: \.self) {
                    Text("\($0)")
                        .font(.largeTitle)
                }
            }
            .padding(.vertical)
            
            VStack(alignment: .leading) {
                ForEach(allColors, id: \.self) { color in
                    Text("this color is: \(color.description)")
                }
            }
        }
    }
}

struct TestNumbersView_Previews: PreviewProvider {
    static var previews: some View {
        TestNumbersView()
    }
}
