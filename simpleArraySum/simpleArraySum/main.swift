//
//  main.swift
//  simpleArraySum
//
//  Created by Park GilNam on 2018. 2. 22..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

import Foundation

let n = Int(readLine()!)!

let arr = readLine()!.components(separatedBy: " ").map{ Int($0)! }

var sum = 0

for elements in 0..<arr.count {
    sum += arr[elements]
}

print(sum)

