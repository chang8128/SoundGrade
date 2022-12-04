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
    func numbered(startingAt start: Int = 0) -> [(number: Int, element: Element)] {
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



struct ColorArrayView: View {
    let columnLayout = Array(repeating: GridItem(), count: 4)
    
    @State var soundLevel = Array<Int>()
    
    
    var body: some View {
        VStack {
            // 显示用户输入的音级Array
            VStack() {
                Text("输入的音级")
                ZStack {
                    HStack {
                        ForEach(soundLevel, id: \.self) {
                            Text("\($0) ")
                                .font(.title3)
                                .foregroundColor(Color.blue)
                        }
                    }
                    
                    RoundedRectangle(cornerRadius: 10.0)
                        .padding(.horizontal)
                        .frame(height: 40.0)
                        .opacity(0.08)
                }
            }
            
            
            // 显示从小到大排列的音级的计算结果
            ScrollView {
                VStack {
                    Text("从小到大排序")
                    ZStack {
                        HStack {
                            ForEach(soundLevel.sorted(), id: \.self) {
                                Text("\($0) ")
                                    .font(.title3)
                                    .foregroundColor(Color.blue)
                            }
                        }
                        
                        RoundedRectangle(cornerRadius: 5.0)
                            .padding(.horizontal)
                            .frame(height: 40.0)
                            .foregroundColor(Color.blue)
                            .opacity(0.2)
                    }
                    
                    Text("最大音级 - 最小音级")
                }
            }
            
            
            // 定义音级按钮 0～11，各按钮对应的序号在点击后传递给[columnLayout]
            LazyVGrid(columns: columnLayout) {
                ForEach(myColors.numbered(), id: \.element.id) { number, item in
                    Button {
                        soundLevel.append(number)
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
            .padding(.horizontal)
            
            HStack {
                Button("清除数据") {
                    soundLevel.removeAll()
                }
                .buttonStyle(.bordered)
                
                
                Button("计算音级") {
                    soundLevel.removeAll()
                }
                .buttonStyle(.borderedProminent)
            }
            
            
            
        }
    }
}

struct ColorArrayView_Previews: PreviewProvider {
    static var previews: some View {
        ColorArrayView()
    }
}
