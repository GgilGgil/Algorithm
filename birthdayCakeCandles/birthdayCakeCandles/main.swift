//
//  main.swift
//  birthdayCakeCandles
//
//  Created by Park GilNam on 2018. 2. 22..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

import Foundation

let n = Int(readLine()!)!
var arr = readLine()!.components(separatedBy: " ").flatMap { Int($0) }

while arr.count != n {
    print("error! age == candles")
    
    arr = readLine()!.components(separatedBy: " ").flatMap { Int($0) }
}

let maxNumber = arr.max()
let maxNumArr = arr.filter { $0 == maxNumber }

print(maxNumArr.count)
