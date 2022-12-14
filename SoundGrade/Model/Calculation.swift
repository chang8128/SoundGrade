//
//  Calculation.swift
//  SoundGrade
//
//  Created by 常志平 on 10/12/22.
//

import Foundation

struct Difference {
    func minDifference(array: [Int]) -> [(resultArray: [Int], firstDiff: Int, secondDiff: Int)] {
        let sortedArray = array.sorted()
        var shiftArray = sortedArray
        var firstDiff = sortedArray[sortedArray.count - 1] - sortedArray[0]
        var secondDiff = sortedArray[sortedArray.count - 2] - sortedArray[0]
        print(sortedArray, firstDiff, secondDiff)
        
        var resultArray = [Int]()
        var rotatedArrays: [(resultArray: [Int], firstDiff: Int, secondDiff: Int)] = []
        
        rotatedArrays.append((sortedArray, firstDiff, secondDiff))
        
        for _ in 0..<shiftArray.count - 1 {
            let firstElement = shiftArray.removeFirst()
            shiftArray.append(firstElement)
            var first = shiftArray[shiftArray.count - 1] - shiftArray[0]
            
            if first < 0 {
                first = first + 12
                firstDiff = first
                resultArray = shiftArray
                
                var second = resultArray[resultArray.count - 2] - resultArray[0]
                if second < 0 {
                    second = second + 12
                    secondDiff = second
                    
                    rotatedArrays.append((resultArray, firstDiff, secondDiff))
                    
                } else {
                    secondDiff = second
                    
                    rotatedArrays.append((resultArray, firstDiff, secondDiff))
                }
            } else {
                firstDiff = first
                resultArray = shiftArray
                
                var second = resultArray[resultArray.count - 2] - resultArray[0]
                if second < 0 {
                    second = second + 12
                    secondDiff = second
                    
                    rotatedArrays.append((resultArray, firstDiff, secondDiff))
                } else {
                    secondDiff = second
                    
                    rotatedArrays.append((resultArray, firstDiff, secondDiff))
                }
            }
            print(resultArray, firstDiff, secondDiff)
        }
        return rotatedArrays
    }
}
