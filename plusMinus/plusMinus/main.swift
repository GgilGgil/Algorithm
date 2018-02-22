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

extension Double {
    mutating func roundToPlaces(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return Darwin.round(self * divisor) / divisor
    }
}

// number of elements
let n = Int(readLine()!)!

// read array and map the elements to integer
let arr = readLine()!.components(separatedBy: " ").map{ Int($0)! }

var positive = fraction(numbers: arr) { $0 > 0 }
var negative = fraction(numbers: arr) { $0 < 0 }
var zero = fraction(numbers: arr) { $0 == 0 }

print(positive.roundToPlaces(places: 6), negative.roundToPlaces(places: 6), zero.roundToPlaces(places: 6), separator: "\n")

