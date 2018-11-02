//
//  main.swift
//  RadixSort
//
//  Created by 박길남 on 02/11/2018.
//  Copyright © 2018 swieeft. All rights reserved.
//

import Foundation

//func sort(data:[Int], p:Int, k:Int) {
//
//    var array = data
//
//    for i in 0..<p {
//
//        var index = 0
//
//        var temp:[Int] = Array(repeating: 0, count: array.count)
//        var count:[Int] = Array(repeating: 0, count: k)
//
//        let pval = Int(pow(Double(k), Double(i)))
//
//        for e in array {
//            index = Int((e / pval) % k)
//            count[index] += 1
//        }
//
//        for j in 1..<k {
//            count[j] = count[j] + count[j - 1]
//        }
//
//        for j in stride(from: data.count - 1, through: 0, by: -1) {
//            index = Int((array[j] / pval) % k)
//
//            temp[count[index] - 1] = array[j]
//            count[index] -= 1
//        }
//
//        array = temp
//    }
//
//    print(array)
//}

func sort(data:[Int], p:Int, k:Int) {
    var array = data

    for i in 0..<p {
        var temp:[Int] = Array(repeating: 0, count: array.count)
        var count:[Int] = Array(repeating: 0, count: k)
        
        let pval = Int(pow(Double(k), Double(i)))
        
        for e in array {
            let index = Int((e / pval) % k)
            count[index] += 1
        }
        
        for j in 1..<k {
            count[j] = count[j] + count[j - 1]
        }
        
        for e in array.reversed() {
            let index = Int((e / pval) % k)
            temp[count[index] - 1] = e
            count[index] -= 1
        }
        
        array = temp
    }
        
    print(array)
}

let array = [170, 45, 75, 90, 2, 24, 802, 66]
sort(data: array, p: 3, k: 10)


























