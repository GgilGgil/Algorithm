//
//  main.swift
//  timeConversion
//
//  Created by Park GilNam on 2018. 2. 22..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

import Foundation

let input = readLine()!

let ampm = input[input.index(input.endIndex, offsetBy: -2)...input.index(input.endIndex, offsetBy: -1)]

var time = input[..<input.index(input.endIndex, offsetBy: -2)]

let timeArr = time.split(separator: ":")
let hour = timeArr[timeArr.startIndex]
var hourInt = Int(hour)!

var militaryTime:String = ""

if ampm == "PM" && hourInt != 12 {
    hourInt = hourInt + 12
    militaryTime = "\(hourInt):\(timeArr[1]):\(timeArr[2])"
} else if ampm == "AM" && hourInt == 12 {
    militaryTime = "00:\(timeArr[1]):\(timeArr[2])"
} else {
    militaryTime = "\(hour):\(timeArr[1]):\(timeArr[2])"
}

print(militaryTime)

