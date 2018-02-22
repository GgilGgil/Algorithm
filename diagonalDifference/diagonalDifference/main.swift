//
//  main.swift
//  diagonalDifference
//
//  Created by Park GilNam on 2018. 2. 22..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

import Foundation

// read the integer n
let n = Int(readLine()!)!

// declare 2d array
var arr: [[Int]] = []

// read array row-by-row
for _ in 0..<n {
    arr.append(readLine()!.components(separatedBy: " ").map{ Int($0)! })
}

var primaryDiagonal = 0
var secondaryDiagonal = 0

for index in 0..<n {
    primaryDiagonal += arr[index][index]

    let secondaryIndex = (n - 1) - index
    secondaryDiagonal += arr[index][secondaryIndex]
}

//다른 방법
//let primaryDiagonal = (0..<n)
//    .map { row in
//        let column = row
//        return arr[row][column]
//}.reduce(0, +)
//
//let secondaryDiagonal = (0..<n)
//    .map { row in
//        let column = n - row - 1
//        return arr[row][column]
//}.reduce(0, +)

print(abs(primaryDiagonal-secondaryDiagonal))
