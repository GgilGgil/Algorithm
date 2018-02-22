//
//  main.swift
//  mini-Max Sum
//
//  Created by Park GilNam on 2018. 2. 22..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

import Foundation

let arr = readLine()!
    .components(separatedBy: " ")
    .flatMap { Int($0) }
    .sorted()

let minSum = arr.prefix(4).reduce(0, +)
let maxSum = arr.suffix(4).reduce(0, +)

print(minSum, maxSum)

