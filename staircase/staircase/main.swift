//
//  main.swift
//  staircase
//
//  Created by Park GilNam on 2018. 2. 22..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

import Foundation

let n = Int(readLine()!)!

for stair in 1...n {
    print("\(String(repeating: Character(" "), count: n - stair))\(String(repeating: Character("#"), count: stair))")
}

//다른 방법
//(1...n)
//    .map { stair in
//        let str = String(repeating: "#", count: stair)
//        .padding(toLength: n, withPad: " ", startingAt: 0)
//        .reversed()
//
//        return String(str)
//
//    }.forEach { print($0) }


