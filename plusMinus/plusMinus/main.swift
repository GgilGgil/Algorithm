//
//  main.swift
//  plusMinus
//
//  Created by Park GilNam on 2018. 2. 22..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

import Foundation

func fraction(numbers: [Int], isIncluded: (Int) -> Bool) -> Double {
    let includedNumbers = numbers.filter(isIncluded)
    return Double(includedNumbers.count) / Double(numbers.count)
}

// number of elements
let n = Int(readLine()!)!

// read array and map the elements to integer
let arr = readLine()!.components(separatedBy: " ").map{ Int($0)! }

let positive = fraction(numbers: arr) { $0 > 0 }
let negative = fraction(numbers: arr) { $0 < 0 }
let zero = fraction(numbers: arr) { $0 == 0 }

print(positive, negative, zero, separator: "\n")
