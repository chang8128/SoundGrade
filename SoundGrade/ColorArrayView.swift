//
//  TestColorArrayView.swift
//  SoundGrade
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
    
    @State var inputGrade = Array<Int>()
    
    @State var difference = Difference()
    
//    @State var inputValue = ""
    
    @State var output: [([Int], Int, Int)] = []
    
    // 使用 Hashable 协议
    struct HashableTuple: Hashable {
        let value: ([Int], Int, Int)
        
        func hash(into hasher: inout Hasher) {
            // 实现 hash 函数
            hasher.combine(value.0)
            hasher.combine(value.1)
            hasher.combine(value.2)
        }
        
        static func == (lhs: HashableTuple, rhs: HashableTuple) -> Bool {
            // 实现 == 函数
            return lhs.value.0 == rhs.value.0 && lhs.value.1 == rhs.value.1 && lhs.value.2 == rhs.value.2
        }
    }
    
    
    
    // 将原来的元组转换为 HashableTuple 类型
    var hashableOutput: [HashableTuple] {
        output.map { HashableTuple(value: $0)}
    }
    
    
    func funcTest(_ input: String) -> String {
        //在这里执行函数操作
        return "Hello " + input
    }
    
    
    var body: some View {
        VStack {
            // 显示用户输入的音级Array
            VStack() {
                Text("输入的音级")
                ZStack {
                    HStack {
                        ForEach(inputGrade, id: \.self) {
                            Text("\($0) ")
                                .font(.title3)
                                .foregroundColor(Color.blue)
                        }
                    }
                    
                    RoundedRectangle(cornerRadius: 5.0)
                        .padding(.horizontal)
                        .frame(height: 40.0)
                        .opacity(0.08)
                }
            }
            
            Divider()
            Text("Shift sound grade、Last - 1st， 2nd last - 1st：")
                .fontWeight(.bold)
            
            VStack(alignment: .center) {
                ScrollView {
                    ForEach(hashableOutput, id: \.self) { item in
                        HStack {
                            Group {
                                Text("[ \(item.value.0.map { String($0)}.joined(separator: ",")) ]")
                                Text("\(item.value.1)")
                                Text("\(item.value.2)")
                            }
                            .font(.title2)
                            .padding(.top, 6.0)
                            .padding(.horizontal)
                        }
                    }
                }
                .padding()
            }
            
            
            
            
            // 定义音级按钮 0～11，各按钮对应的序号在点击后传递给[columnLayout]
            LazyVGrid(columns: columnLayout) {
                ForEach(myColors.numbered(), id: \.element.id) { number, item in
                    Button {
                        inputGrade.append(number)
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
                Button("清除输入") {
                    inputGrade.removeAll()
                }
                .buttonStyle(.bordered)
                .padding()
                
                
                // 定义一个按钮，执行函数并输入参数 inputGrade
                Button(action: {
                    let result = difference.minDifference(array: inputGrade)
                    self.output = result
                }) {
                    Text("计算音级")
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
