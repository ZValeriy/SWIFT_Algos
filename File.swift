//
//  File.swift
//  
//
//  Created by Валерий Зубаиров on 03.04.2020.
//
var str: [String] = (readLine()?.split(separator: " ").map (String.init))!
var arr = [Int]()
str.map({
    if let x = Int($0) {
    arr.append(x)
    }
})

print(maxPairwiseFast(arr))

func maxPairwiseFast(_ array: [Int]) -> Int {
    var maxInd1 = 0
    var maxInd2 = 0
    
    for i in 0..<array.count {
        if array[i] > array[maxInd1] {
            maxInd1 = i
        }
    }
    
    for i in 0..<array.count {
        if i != maxInd1 && array[i] > array[maxInd2] {
            maxInd2 = i
        }
    }
    
    return array[maxInd1] * array[maxInd2]
}
