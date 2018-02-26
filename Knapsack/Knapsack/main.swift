//
//  main.swift
//  Knapsack
//
//  Created by Park GilNam on 2018. 2. 26..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

import Foundation

func sumfn(a:[Int], k:Int, n:Int) -> Int {
    if n == 0 || k == 0 {
        return 0
    }

    if a[n-1] > k {
        return sumfn(a: a, k: k, n: n-1)
    }

    let x = a[n-1]+sumfn(a: a, k: k-a[n-1], n: n)
    let y = sumfn(a: a, k: k, n: n-1)

    return max(x, y)
}

var t = Int(readLine()!)!

var result = [Int]()

for _ in 0..<t {
    
    var arr = readLine()!.components(separatedBy: " ").flatMap { Int($0) }
    
    let n = arr[0]
    let k = arr[1]
    
    let a = readLine()!.components(separatedBy: " ").flatMap { Int($0) }
    
    result.append(sumfn(a: a, k: k, n: n))
}

for i in 0..<result.count {
    print(result[i])
}
