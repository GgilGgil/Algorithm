//
//  main.swift
//  aVeryBigSum
//
//  Created by Park GilNam on 2018. 2. 22..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

import Foundation

var n = Int(readLine()!)!

while n < 1 || n > 10 {
    print("error : 1 <= n <= 10")
    
    n = Int(readLine()!)!
    
    if n >= 1 && n <= 10 {
        break
    }
}

let arr = readLine()!.components(separatedBy: " ").map{ Int($0)! }

print(arr.reduce(0, +))
