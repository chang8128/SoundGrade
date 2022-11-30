//
//  TestColorArrayView.swift
//  SoundLevel
//
//  Created by 常志平 on 30/11/22.
//

import SwiftUI

// 让代码更易读，特别是\.1和Array(…)的部分，为了增加易读性（Clarity at the point of use）, 我们可以再进一步。可以给Sequence增加一个扩展：
extension Sequence {
    /// Numbers the elements in `self`, starting with the specified number.
    /// - Returns: An array of (Int, Element) pairs.
    func numbered(startingAt start: Int = 1) -> [(number: Int, element: Element)] {
        Array(zip(start..., self))
    }
}

struct MyColor: Identifiable {
    let id = UUID()
    let linkColor: Color
}

let myColors: [MyColor] = [
    MyColor(linkColor: .pink),
    MyColor(linkColor: .red),
    MyColor(linkColor: .orange),
    MyColor(linkColor: .yellow),
    MyColor(linkColor: .mint),
    MyColor(linkColor: .teal),
    MyColor(linkColor: .cyan),
    MyColor(linkColor: .blue),
    MyColor(linkColor: .indigo),
    MyColor(linkColor: .purple),
    MyColor(linkColor: .brown),
    MyColor(linkColor: .gray),
]


struct TestColorArrayView: View {
    let columnLayout = Array(repeating: GridItem(), count: 4)
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            ForEach(myColors.numbered(), id: \.element.id) { number, item in
                Text("\(number). \(item.linkColor.description)")
            }
            
            LazyVGrid(columns: columnLayout) {
                ForEach(myColors.numbered(), id: \.element.id) { number, item in
                    Button {
                        print("do some")
                    } label: {
                        ZStack {
                            Text("\(number)")
                                .fontWeight(.bold)
                                .font(.title)
                            RoundedRectangle(cornerRadius: 30.0)
                                .aspectRatio(1.0, contentMode: ContentMode.fit)
                                .foregroundColor(item.linkColor)
                                .opacity(0.5)
                        }
                    }
                }
            }
        }
    }
}

struct TestColorArrayView_Previews: PreviewProvider {
    static var previews: some View {
        TestColorArrayView()
    }
}
